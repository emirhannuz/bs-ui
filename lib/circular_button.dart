import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double width, height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.width, this.height, this.color, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
      ),
      width: this.width,
      height: this.height,
      child: IconButton(
        color: Colors.red,
        icon: this.icon,
        onPressed: this.onClick,
        enableFeedback: true,
      ),
    );
  }
}
