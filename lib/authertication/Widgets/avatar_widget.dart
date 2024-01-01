import 'package:flutter/material.dart';

import '../../imagePath/imagesPathes.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(90),
      ),
      child: CircleAvatar(
        radius: 80,
        child: Image.asset(ImageManager.OpenAi),
      ),
    );
  }
}
