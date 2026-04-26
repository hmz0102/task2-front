// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> images = [
      {"img": "images/11.png", "isvideo": false},
      {"img": "images/12.png", "isvideo": true},
      {"img": "images/13.png", "isvideo": false},
      {"img": "images/14.png", "isvideo": true},
      {"img": "images/15.png", "isvideo": false},
      {"img": "images/16.png", "isvideo": true},
      {"img": "images/17.png", "isvideo": false},
      {"img": "images/18.png", "isvideo": true},
      {"img": "images/19.png", "isvideo": false},
    ];
    List<Map<String, dynamic>> rev_images = images.reversed.toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: 80, left: 15, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("s.khasanov_", style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                drawerIcon("images/Icon1.png", "Archive"),
                SizedBox(height: 10),
                drawerIcon("images/Icon2.png", "Your Activity"),
                SizedBox(height: 10),
                drawerIcon("images/Icon3.png", "Nametag"),
                SizedBox(height: 10),
                drawerIcon("images/Icon4.png", "Saved"),
                SizedBox(height: 10),
                drawerIcon("images/Icon5.png", "Close Friends"),
                SizedBox(height: 10),
                drawerIcon("images/add.png", "Discover People"),
                SizedBox(height: 10),
                drawerIcon("images/Icon6.png", "Open Facebook"),
                Spacer(),
                drawerIcon("images/Vector.png", "Log out"),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_sharp, size: 20),
              Text(" jacob_w ", style: TextStyle(fontSize: 20)),
              Icon(Icons.arrow_drop_down_rounded, size: 25),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture and Stats
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xffC7C7CC),
                              width: 2,
                            ),
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
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        //end of profile pic
                        SizedBox(width: 60),
                        Column(
                          children: [
                            Text(
                              "54",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text("Posts"),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "834",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text("Followers"),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "162",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text("Following"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Name and Bio
                    Text("Jacob West"),
                    RichText(
                      text: TextSpan(
                        text: "Digital goodies designer ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "@pixsellz",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: "\nEverything is designed.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    // Edit Profile Button
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey),
                      ),
                      minWidth: double.infinity,
                      child: Text("Edit Profile"),
                    ),
                    SizedBox(height: 10),
                    // Stories Section
                    SizedBox(
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Color(0xff262626),
                                ),
                              ),
                              Text("New", style: TextStyle(fontSize: 15)),
                            ],
                          ),
                          SizedBox(width: 20),
                          stroy("images/8.png", "Friends "),
                          SizedBox(width: 20),
                          stroy("images/9.png", "Sport "),
                          SizedBox(width: 20),
                          stroy("images/10.png", "Design "),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.grid_on, size: 30)),
                  Tab(icon: Icon(Icons.person_pin_outlined, size: 30)),
                ],
                indicatorColor: Color(0xff262626),
                dividerColor: Colors.grey,
                labelColor: Colors.grey,
                unselectedLabelColor: Colors.grey,
              ),

              SizedBox(
                height: 600,
                width: double.infinity,
                child: TabBarView(
                  children: [
                    // First Tab - Grid View
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: images.length, // Add item count
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey[300],
                          child: videoIconOrPic(images[index]),
                        );
                      },
                    ),
                    // Second Tab - Grid View
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: images.length, // Add item count
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey[400],
                          child: videoIconOrPic(rev_images[index]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Story Widget
Widget stroy(String picName, String des) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              picName,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Text(des, style: TextStyle(fontSize: 15)),
    ],
  );
}

Widget drawerIcon(String img, String name) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      leading: Image.asset(img, width: 25, height: 25),
      title: Text(name, style: TextStyle(fontSize: 20)),
    ),
  );
}

Widget videoIconOrPic(Map<String, dynamic> item) {
  if (item["isvideo"]) {
    return Stack(
      children: [
        Image.asset(item["img"], fit: BoxFit.cover),
        Positioned(
          right: 8,
          top: 8,
          child: Image.asset("images/video.png", width: 20, height: 20),
        ),
      ],
    );
  } else {
    return Image.asset(item["img"], fit: BoxFit.cover);
  }
}
