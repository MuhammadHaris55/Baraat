import 'package:flutter/material.dart';

class ReusableAlreadyText extends StatelessWidget {
  final String text;
  const ReusableAlreadyText(
      {Key? key, required this.text, required this.onClick})
      : super(key: key);
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              onClick();
            },
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
