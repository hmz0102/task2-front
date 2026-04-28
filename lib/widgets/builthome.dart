import 'package:etrain/widgets/post.dart';
import 'package:flutter/material.dart';

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
          PostWidget(
            picName: "assets/joshua_l.png",
            name: "joshua_l",
            address: "Tokyo, Japan",
            postPic: "assets/post.png",
            postDes:
                " The game in Japan was amazing and I want to share some photos",
          ),
          SizedBox(height: 20),
          PostWidget(
            picName: "assets/joshua_l.png",
            name: "joshua_l",
            address: "Tokyo, Japan",
            postPic: "images/7.png",
            postDes: " I'm so excited to share my new photos with you all",
          ),
          SizedBox(height: 20),
          PostWidget(
            picName: "assets/karennne.png",
            name: "karennne",
            address: "zackjohn",
            postPic: "assets/post.png",
            postDes: " I'm so excited to share my new photos with you all",
          ),
        ],
      ),
    ),
  );
}
