import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var top = 0.0;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool gotFocus = false;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      gotFocus = false;
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          gotFocus = true;
        });
        // Handle focus gained
      } else {
        setState(() {
          gotFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 2.h,
            elevation: 0,
            pinned: true,
            floating: true,
            collapsedHeight: 5.h,
            expandedHeight: 8.h,
            flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;

              return FlexibleSpaceBar(
                centerTitle: top > 12.h ? false : true,
                titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                title: const Text(
                  "Flutter Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                background: Container(
                  color: Colors.white,
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: gotFocus ? Colors.blue : Colors.grey)),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: gotFocus ? 4 : 1,
                      controller: _controller,
                      focusNode: _focusNode,
                      style: const TextStyle(fontSize: 14),
                      onChanged: (value) {
                        setState(() {
                          count = value.length;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Flutter Title",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                      ),
                    ),
                    gotFocus
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('$count/300'),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.blue)),
                                  child: const Padding(
                                    padding:  EdgeInsets.all(4.0),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: Container()),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var top = 0.0;
//   bool isHidden = false;
//
//
//   setHidden(var value) {
//     print(value.toString());
//     if(value.toString() == '76.0') {
//       Future.delayed(Duration(milliseconds: 100)).then((value) {
//         setState(() {
//           isHidden = true;
//           print(isHidden.toString());
//         });
//       });
//
//
//     }  else {
//       setState(() {
//         isHidden = false;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.white,
//             automaticallyImplyLeading: false,
//             toolbarHeight: 25,
//             elevation: 0,
//             pinned: true,
//             floating: true,
//             collapsedHeight: 40,
//             expandedHeight: 41,
//             flexibleSpace:  LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   // top = constraints.biggest.height;
//                   // WidgetsBinding.instance.addPostFrameCallback((_) {
//                   //  setHidden(top);
//                   // });
//                   return isHidden == true ? Container() :  top == 76.0 ?  FlexibleSpaceBar(
//                     collapseMode: CollapseMode.parallax,
//                     centerTitle:  true,
//                     titlePadding: EdgeInsets.only(left: 16, bottom: 10),
//                     title: Text(
//                       top == 77.0 ? '' :
//                       isHidden == true ?
//                       "Flutter Title" : '' ,
//                       style: TextStyle(color: Colors.black, fontSize:12,),
//                     ),
//                     background: Container(
//                       color: Colors.white,
//                     ),
//                   ) : Container() ;
//                 }),
//           ),
//
//           SliverToBoxAdapter(
//             child: Padding(
//               padding:EdgeInsets.only(left: 16, bottom: 10),
//               child: Text(
//                 "Flutter Title",
//                 style: TextStyle(color: Colors.black, fontSize:12,),
//               ),
//             ),
//           ) ,
//           SliverToBoxAdapter(
//             child: Container(
//               height: 1000,
//
//             ),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
