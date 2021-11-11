import 'package:flutter/material.dart';

class ExpansionTileItem extends StatelessWidget {
  const ExpansionTileItem({
    required this.givenText,
    this.givenFunction,
  });

  final String givenText;
  final Function? givenFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Inside');
        givenFunction!();
      },
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            givenText,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
