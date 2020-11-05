import 'package:CreateMotionsTask/screens/home_screen.dart';
import 'package:CreateMotionsTask/screens/main_screen.dart';
import 'package:CreateMotionsTask/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;
  final pageOption = [
    HomeScreen(),
    HomeScreen(),
    MainScreen(),
    ProfileScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            Image.asset(
              'assets/man.png',
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ],
        ),
      ),
      body: pageOption[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.grey.shade200,
        activeColor: Colors.blue,
        items: [
          TabItem(icon: Icons.home, title: ''),
          TabItem(icon: Icons.chat, title: ''),
          TabItem(icon: Icons.add, title: ''),
          TabItem(icon: Icons.notifications, title: ''),
          TabItem(icon: Icons.person, title: ''),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
