import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  /// a custom dialog for
  const CustomAlertDialog({
    required this.givenHeader,
    required this.givenSubheader,
    required this.givenChoice1,
    required this.givenChoice2,
    required this.givenFunction,
  });

  /// header for dialog
  final String givenHeader;

  /// subheader for dialog

  final String givenSubheader;

  /// first choice for dialog generally negative one

  final String givenChoice1;

  /// second choice for dialog generally positive one

  final String givenChoice2;

  /// Given function when pressed second choice

  final Function givenFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Text(
              givenHeader,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              givenSubheader,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
                child: Text(
                  givenChoice1,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text(
                  givenChoice2,
                  //color: Colors.white
                ),
                onPressed: () {
                  givenFunction();
                })
          ])
        ],
      ),
    );
  }
}
