import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme
        .of(context)
        .colorScheme
        .primary;
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditButtonIcon(color),
          )
        ],
      ),
    );
  }

  buildImage() {
    const image = const AssetImage(" ");

    return ClipOval(
      child: Material(
        color: Colors.grey,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128.0,
          height: 128.0,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }
}

Widget buildEditButtonIcon(Color color) =>
    buildCircle(
      color: color,
      all: 8,
      child: const Icon(
        Icons.camera_alt,
        size: 20,
        color: Colors.white,
      ),
    );

buildCircle({
  required Color color,
  required double all,
  required Widget child}) =>
ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
)
;


