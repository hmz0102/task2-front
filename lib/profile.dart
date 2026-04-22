import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
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
                                "assets/1.png",
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Posts"),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "834",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Followers"),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "162",
                              style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
            // Pinned TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on, size: 30)),
                    Tab(icon: Icon(Icons.person_pin_outlined, size: 30)),
                  ],
                  indicatorColor: Color(0xff262626),
                  dividerColor: Colors.grey,
                  labelColor: Colors.grey,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // First Tab - Grid View
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: 30, // Add item count
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: Center(child: Text('${index + 1}')),
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
              itemCount: 30, // Add item count
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[400],
                  child: Center(child: Text('${index + 1}')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom SliverPersistentHeaderDelegate for TabBar
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
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
