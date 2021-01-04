import 'package:bmicalc/constants.dart';
import 'package:bmicalc/screens/bmrPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'screens/bmiPage.dart';
import 'screens/bmrPage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //          primaryColor: Color(0xFF0A0E10),
        primaryColor: Color(0xFF0A0E10),
        // scaffoldBackgroundColor: Color(0xFF0A0E10),
        scaffoldBackgroundColor: Color(0xFF17202A),
      ),
      home: UsingPageView(),
    ));

var onStyle =
    TextStyle(fontSize: 35.0, fontWeight: FontWeight.w900, color: Colors.pink);
var offStyle = TextStyle(
    fontSize: 25.0, fontWeight: FontWeight.w900, color: Colors.white60);
var temp = TextStyle(
    fontSize: 25.0, fontWeight: FontWeight.w900, color: Colors.white60);
int curPage = 0;

class UsingPageView extends StatefulWidget {
  @override
  _UsingPageViewState createState() => _UsingPageViewState();
}

class _UsingPageViewState extends State<UsingPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Hello'),
        elevation: 40,
        actions: [
          // IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: null),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (curPage == 1){
                        _controller.animateToPage(
                          --curPage,
                          duration: Duration(microseconds: 250),
                          curve: Curves.linear,
                        );
                      }
                      if (curPage < 0) curPage = 0;
                    });
                  },
                  // style: ButtonStyle(
                  //   enableFeedback: false,
                  // ),
                  child: Center(
                      child: Text(
                    'BMI',
                    style: onStyle,
                  )))),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (curPage == 0) {
                        _controller.animateToPage(
                            ++curPage,
                            duration: Duration(microseconds: 250),
                            curve: Curves.linear,
                        );
                      }
                      if (curPage > 1) curPage = 1;
                    });
                  },
                  child: Center(
                      child: Text(
                    'BMR',
                    style: offStyle,
                  )))),
          // IconButton(
          //     icon: Icon(Icons.arrow_forward_ios_rounded), onPressed: null),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (page) {
          setState(() {
            temp = onStyle;
            onStyle = offStyle;
            offStyle = temp;
          });
        },
        scrollDirection: Axis.horizontal,
        children: [
          BMIPage(),
          BMRPage(),
        ],
      ),
    );
  }
}
