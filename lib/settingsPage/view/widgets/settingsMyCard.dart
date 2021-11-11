import 'package:flutter/material.dart';

class SettingsMyCard extends StatelessWidget {
  const SettingsMyCard({
    required this.givenIcon,
    required this.givenText,
  });
  final String givenText;
  final Icon givenIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.73, //137
      height: MediaQuery.of(context).size.height / 9.22, //88

      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            givenIcon,
            SizedBox(
              height: 8,
            ),
            Text(
              givenText,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
