//App Bar used in BMI Page
//Appbar used in input page
//
// appBar:PreferredSize(
//   preferredSize: Size.fromHeight(60),
//   child: AppBar(
//     actions: <Widget>[
//       Expanded(
//         child:ReusableCard(
//           colour: Colors.pink,
//           cardChild: Center(
//             child:Text(
//               ' BMI ',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ),
//           onPress: (){
//             Navigator.pushReplacement(
//               context ,
//               MaterialPageRoute(builder: (context) => InputPage()),
//             );
//           },
//         ),
//       ),
//       Expanded(
//         child:ReusableCard(
//           colour: Colors.blueGrey,
//           cardChild: Center(
//             child: Text(
//               ' BMR ',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//           ),
//           onPress: (){
//             Navigator.pushReplacement(
//               context ,
//               MaterialPageRoute(builder: (context) => BMRPage()),
//             );
//           },
//         ),
//       ),
//     ],
//   ),
// ),




//App Bar used in BMR Page
//

// appBar:PreferredSize(
// preferredSize: Size.fromHeight(60),
// child: AppBar(
// brightness: Brightness.dark,
// elevation: 40,
// actions: <Widget>[
// IconButton(icon: Icon(Icons.arrow_back_ios,
// size: 32,
// color: Colors.white,
//
// )
// , onPressed: null),
//
// Expanded(
// child: Center(
// child: Text(
// 'BMR',
// style: TextStyle(
// fontSize: 30,
// fontWeight:FontWeight.bold,
// ),
// ),
// ),
// ),
// ],
// ),
// ),


//Extras From main.dart
// class BMICalculator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setPreferredOrientations([
//     //   DeviceOrientation.portraitUp,
//     //   DeviceOrientation.portraitDown,
//     // ]);
//     return MaterialApp(
//       theme:ThemeData.dark().copyWith(
// //          primaryColor: Color(0xFF0A0E10),
//         primaryColor: Color(0xFF0A0E10),
//          // scaffoldBackgroundColor: Color(0xFF0A0E10),
//         scaffoldBackgroundColor: Color(0xFF17202A),
//       ),
//
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//           child: UsingPageView(),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
