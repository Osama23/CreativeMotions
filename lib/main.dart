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
      title: 'Creative Motions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

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
                  color: Colors.black),
            ),
            CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: Image.asset(
                  'assets/man.png',
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover, // Image.memory(
                  //   dataFromBase64String(
                  //     widget.actors.data.banner[0].image == null
                  //       ? ""
                  //       : widget.actors.data.banner[0].image
                  //   ),
                ),
              ),
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
        initialActiveIndex: 2, //optional, default as 0
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
