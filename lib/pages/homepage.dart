// ignore_for_file: unused_import, prefer_final_fields, unused_field

import 'package:etrain/classes/builthome.dart';
import 'package:etrain/classes/post.dart';
import 'package:etrain/pages/activePage.dart';
import 'package:etrain/pages/addPage.dart';
import 'package:etrain/pages/profile.dart';
import 'package:etrain/pages/serach.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      builthome(),
      const Serach(),
      const Addpage(),
      const Activepage(),
      const Profile(),
    ];
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, size: 30),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 30),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffC7C7CC), width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    "assets/Your Story.png",
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
