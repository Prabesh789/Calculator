import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final color;
  final textColor;
  final String btnText;
  final btnTapped;

  const MyBtn(
      {Key key, this.color, this.textColor, this.btnText, this.btnTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
