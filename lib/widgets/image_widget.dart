import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final ImageProvider<Object> image;
  const ProfileWidget({
    Key? key,
    required this.onClicked,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.teal;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 4,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.fill,
          width: 110,
          height: 110,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 10,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
