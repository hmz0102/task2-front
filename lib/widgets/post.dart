import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final String picName;
  final String name;
  final String address;
  final String postPic;
  final String postDes;

  const PostWidget({
    super.key,
    required this.picName,
    required this.name,
    required this.address,
    required this.postPic,
    required this.postDes,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int _currentPage = 1;
  bool liked = false;
  List<String> get images => [widget.postPic, "images/8.png", "images/9.png"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Profile Info)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    widget.picName,
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
                          widget.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Image.asset("images/verify.png", width: 20, height: 20),
                      ],
                    ),
                    subtitle: Text(widget.address),
                    trailing: const Icon(Icons.more_horiz),
                  ),
                ),
              ],
            ),
          ),

          // 2. Post Image
          SizedBox(
            height: 410,
            width: double.infinity,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index + 1; // تحديث العداد عند التقليب
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      images[index],
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Text(
                          "$_currentPage/3",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  child: Image.asset(
                    liked ? "images/fullLike.png" : "assets/Like.png",
                    width: 28,
                    height: 28,
                    color: liked ? Colors.red : null,
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Comment.png",
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {},
                  child: Image.asset("images/Shape.png", width: 28, height: 28),
                ),
                const SizedBox(width: 50),
                // Pagination dots
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: buildDot(
                        index + 1 == _currentPage ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, size: 27),
                ),
              ],
            ),
          ),

          // 4. Likes & Description
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
                const Text(
                  "craig_love ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text("and "),
                const Text(
                  "44,686 others ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "${widget.name} ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: widget.postDes),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("19 September", style: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot(Color color) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
