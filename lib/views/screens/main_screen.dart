import 'package:demo_flutter_project/views/pages/add_company_page.dart';
import 'package:demo_flutter_project/views/pages/input_company_page.dart';
import 'package:demo_flutter_project/views/pages/list_company_page.dart';
import 'package:demo_flutter_project/views/pages/painter.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rive/rive.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pageList = [AddCompanyPage(), ListCompanyPage()];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Navigator.pushReplacementNamed(context, '/home_screen');
      // }),
      // appBar: NewGradientAppBar(
      //     gradient: LinearGradient(colors: [
      //   const Color(0xff9941d8).withOpacity(0.2),
      //   const Color(0xffff4500).withOpacity(0.5),
      // ], stops: const [
      //   0.0,
      //   1.0
      // ])),
    // , RivePage()
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "選考状況"),
          // BottomNavigationBarItem(icon: Icon(Icons.animation), label: "アニメーション")

        ],
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
