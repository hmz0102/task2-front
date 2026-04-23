// ignore_for_file: unused_import, prefer_final_fields, unused_field

import 'package:etrain/activePage.dart';
import 'package:etrain/addPage.dart';
import 'package:etrain/profile.dart';
import 'package:etrain/serach.dart';
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
        type: BottomNavigationBarType
            .fixed, // لضمان بقاء الأيقونات في مكانها وتوزيعها بالتساوي
        showSelectedLabels: false, // إخفاء النصوص تحت الأيقونات (مثل إنستجرام)
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
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
          // أيقونة البروفايل (صورة مخصصة)
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

Widget builthome() {
  List name = ["Your Story", "karennne", "zackjohn", "kieron_d", "craig_love"];
  List<Map<String, dynamic>> images = [
    {"img": "assets/Your Story.png", "isLive": false},
    {"img": "assets/karennne.png", "isLive": true},
    {"img": "assets/zackjohn.png", "isLive": false},
    {"img": "assets/kieron_d.png", "isLive": false},
    {"img": "assets/craig_love.png", "isLive": false},
  ];
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Camera Icon.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/IGTV.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/Shape.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 15 : 10,
                    right: 5,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 86,
                            height: 86,
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffA60F93),
                                  Color(0xffD91A46),
                                  Color(0xffFBAA47),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      images[index]["img"],
                                      width: 76,
                                      height: 76,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          if (images[index]["isLive"])
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Image.asset(
                                  "images/Live.png",
                                  width: 35,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        name[index],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 0.5,
            height: 0,
          ),
          const SizedBox(height: 10),
          post(
            picName: "assets/joshua_l.png",
            name: "joshua_l",
            address: "Tokyo, Japan",
            postPic: "assets/post.png",
            postDes:
                " The game in Japan was amazing and I want to share some photos",
            liked: false,
          ),
          SizedBox(height: 20),
          post(
            picName: "assets/joshua_l.png",
            name: "joshua_l",
            address: "Tokyo, Japan",
            postPic: "images/7.png",
            postDes: " I'm so excited to share my new photos with you all",
            liked: true,
          ),
          SizedBox(height: 20),
          post(
            picName: "assets/karennne.png",
            name: "karennne",
            address: "zackjohn",
            postPic: "assets/post.png",
            postDes: " I'm so excited to share my new photos with you all",
            liked: false,
          ),
        ],
      ),
    ),
  );
}

Widget post({
  required String picName,
  required String name,
  required String address,
  required String postPic,
  required String postDes,
  required bool liked,
}) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  picName, //profile picture
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Image.asset("images/verify.png", width: 20, height: 20),
                    ],
                  ),
                  subtitle: Text(address),

                  trailing: const Icon(Icons.more_horiz),
                ),
              ),
            ],
          ),
        ),

        // 2. post image
        Stack(
          children: [
            Image.asset(
              postPic,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Image.asset("images/number.png"),
            ),
          ],
        ),
        SizedBox(height: 20),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  if (liked) // if the post is liked
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "images/fullLike.png",
                        width: 28,
                        height: 28,
                      ),
                    )
                  else // if the post is not liked
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/Like.png",
                        width: 28,
                        height: 28,
                      ),
                    ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/Comment.png",
                      width: 28,
                      height: 28,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "images/Shape.png",
                      width: 28,
                      height: 28,
                    ),
                  ),
                  SizedBox(width: 50),

                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border, size: 27),
                  ),
                ],
              ),
            ),
          ],
        ),
        // 4. وصف المنشور
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/craig_love.png",
                  width: 25,
                  height: 25,
                ),
              ),
              const Text("  Liked by "),
              Text(
                "craig_love ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("and "),
              Text(
                "44,686 others ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: name, //profile name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: postDes, //post description
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${DateTime.now().day.toString()} - ${DateTime.now().month.toString()} - ${DateTime.now().year.toString()}",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
