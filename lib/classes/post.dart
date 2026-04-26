import 'package:flutter/material.dart';

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
          child: Text("19-september", style: TextStyle(color: Colors.grey)),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
