import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLiked;
  const LikeButton({
    Key? key,
    required this.onPressed,
    required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 50,
      shape: CircleBorder(),
      color: Colors.white,
      elevation: 0,
      padding: EdgeInsets.all(8.0),
      onPressed: onPressed,
      child: isLiked
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(
              Icons.favorite_border_outlined,
            ),
    );
  }
}
