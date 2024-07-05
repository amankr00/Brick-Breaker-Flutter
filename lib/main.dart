// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   int p = 10;

//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void _attack() {
//     print("Waah");
//   }

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//       p++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return GestureDetector(
//       child: Scaffold(
//         appBar: AppBar(
//           // TRY THIS: Try changing the color here to a specific color (to
//           // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//           // change color while the other colors stay the same.
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: Text(widget.title),
//         ),
//         body: Column(children: [
//           Expanded(
//               child: SingleChildScrollView(
//             child: Center(
//               // Center is a layout widget. It takes a single child and positions it
//               // in the middle of the parent.
//               child: Column(
//                 // Column is also a layout widget. It takes a list of children and
//                 // arranges them vertically. By default, it sizes itself to fit its
//                 // children horizontally, and tries to be as tall as its parent.
//                 //
//                 // Column has various properties to control how it sizes itself and
//                 // how it positions its children. Here we use mainAxisAlignment to
//                 // center the children vertically; the main axis here is the vertical
//                 // axis because Columns are vertical (the cross axis would be
//                 // horizontal).
//                 //
//                 // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//                 // action in the IDE, or press "p" in the console), to see the
//                 // wireframe for each widget.
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text(
//                     'You have pushed the button this many times:',
//                   ),
//                   Text(
//                     '$_counter , $p',
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                   Container(
//                     height: 1200,
//                     width: 10,
//                     color: Colors.blue,
//                   )
//                 ],
//               ),
//             ),
//           )),
//         ]),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _incrementCounter,
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),

//         bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],

//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//         ),

//         // BottomNavigationBar(
//         //     currentIndex: 0,
//         //     fixedColor: Colors.grey,
//         //     items: [
//         //     BottomNavigationBarItem(
//         //         label: "home",
//         //         icon: Icon(Icons.home),
//         //       ),
//         //       BottomNavigationBarItem(
//         //         label: "search",
//         //         icon: Icon(Icons.search),
//         //       ),
//         //       BottomNavigationBarItem(
//         //         label: "user profile",
//         //         icon: Icon(Icons.account_circle),
//         //       ),
//         //     ],
//         //     onTap: (int itemIndex) {
//         //     },
//         //   ),
//         persistentFooterButtons: <Widget>[
//           FloatingActionButton(
//             backgroundColor: Colors.yellow,
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.yellow,
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.yellow,
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.yellow,
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),

//         ], // This trailing comma makes auto-formatting nicer for build methods.
//       ),
//       onTap: () {
//         _attack();
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:grow/system/card.dart';
// import 'package:grow/system/forms.dart';

// void main() => runApp(MyApp());

// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyStatefulWidget(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _count = 0;

//   void _showAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Alert Dialog Title'),
//           content: Text('This is a basic alert dialog.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Yes'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('No'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _attack() {
//     print("Waah");
//   }

//   void _kill() {
//     print("kill");
//   }

//   void _run() {
//     print("run");
//   }

//   void _save() {
//     print("save");
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Scaffold Example'),
//       ),
//       body: Expanded(child: SingleChildScrollView(
//       child : Column(
//         children :[
//         Text('We have pressed the button $_count times.'),

//         Container(
//         height: 300,
//         width: 400,
//         color: Colors.blue,
//         child: MyCardWidget(),),
//         ]
//       ),
//       )
//       ),
//       // bottomNavigationBar: BottomAppBar(
//       //   shape:CircularNotchedRectangle(),
//       //   child: Container(
//       //     height: 50.0,
//       //     color: Colors.blue,
//       //   ),
//       // ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => setState(() {
//           _count++;
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Container(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: MediaQuery.of(context).size.height * 0.8,
//                     child: MyCustomForm())),
//           );
//         }),
//         tooltip: 'Increment Counter',
//         child: Icon(Icons.apple),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       drawer: Drawer(
//         elevation: 20.0,
//         child: Column(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text("Stark"),
//               accountEmail: Text("aman@starkindustries.in"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.yellow,
//                 child: Text("abc"),
//               ),
//             ),
//             ListTile(
//               title: new Text("Inbox"),
//               leading: new Icon(Icons.mail),
//             ),
//             Divider(
//               height: 0.1,
//             ),
//             ListTile(
//               title: new Text("Primary"),
//               leading: new Icon(Icons.inbox),
//             ),
//             ListTile(
//               title: new Text("Social"),
//               leading: new Icon(Icons.people),
//             ),
//             ListTile(
//               title: new Text("Promotions"),
//               leading: new Icon(Icons.local_offer),
//             )
//           ],
//         ),
//       ),

//       persistentFooterButtons: <Widget>[
//         FloatingActionButton(
//           backgroundColor: Colors.yellow,
//           onPressed: _attack,
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//         FloatingActionButton(
//           backgroundColor: Colors.yellow,
//           onPressed: _save,
//           // tooltip: _save,
//           child: const Icon(Icons.add),
//         ),
//         FloatingActionButton(
//           backgroundColor: Colors.yellow,
//           onPressed: _kill,
//           // tooltip: ,
//           child: const Icon(Icons.add),
//         ),
//         ElevatedButton(
//           // backgroundColor: Colors.yellow,
//           // onPressed: _showAlertDialog(context),
//           onPressed: () => _showAlertDialog(context),
//           // tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:grow/homepage.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
