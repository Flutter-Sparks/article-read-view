import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: const Image(
              width: double.maxFinite,
              fit: BoxFit.cover,
              height: 200,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1518235506717-e1ed3306a89b?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bnljfGVufDB8fDB8fHww')),
        ),
        Container(
          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
          child: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            radius: 60,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/black-white-minimal-portrait_23-2149152642.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}
