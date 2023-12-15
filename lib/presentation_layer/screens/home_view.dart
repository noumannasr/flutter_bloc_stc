import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var top = 0.0;
  bool isHidden = false;


  setHidden(var value) {
    print(value.toString());
    if(value.toString() == '76.0') {
      Future.delayed(Duration(milliseconds: 100)).then((value) {
        setState(() {
          isHidden = true;
          print(isHidden.toString());
        });
      });


    }  else {
      setState(() {
        isHidden = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 25,
            elevation: 0,
            pinned: true,
            floating: true,
            collapsedHeight: 40,
            expandedHeight: 41,
            flexibleSpace:  LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // top = constraints.biggest.height;
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //  setHidden(top);
                  // });
                  return isHidden == true ? Container() :  top == 76.0 ?  FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle:  true,
                    titlePadding: EdgeInsets.only(left: 16, bottom: 10),
                    title: Text(
                      top == 77.0 ? '' :
                      isHidden == true ?
                      "Flutter Title" : '' ,
                      style: TextStyle(color: Colors.black, fontSize:12,),
                    ),
                    background: Container(
                      color: Colors.white,
                    ),
                  ) : Container() ;
                }),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:EdgeInsets.only(left: 16, bottom: 10),
              child: Text(
                "Flutter Title",
                style: TextStyle(color: Colors.black, fontSize:12,),
              ),
            ),
          ) ,
          SliverToBoxAdapter(
            child: Container(
              height: 1000,

            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}