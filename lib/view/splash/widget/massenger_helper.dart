import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  final String msg;
  final Function allowFunction;
  final Function closeAppFunction;

  const Messenger(
      {super.key,
      required this.msg,
      required this.allowFunction,
      required this.closeAppFunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          // top: 250,
          // bottom: 250,
        ),
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Permission Denied",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      closeAppFunction();
                    },
                    child: const Text(
                      'Close App',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      allowFunction();
                    },
                    child: const Text(
                      'Allow',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
