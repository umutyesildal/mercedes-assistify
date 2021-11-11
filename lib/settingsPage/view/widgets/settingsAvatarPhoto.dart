import 'package:flutter/material.dart';
import 'package:template/constants.dart';

class AvatarPhoto extends StatelessWidget {
  const AvatarPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width / 2.81, //133
          height: MediaQuery.of(context).size.height / 6.1, //133
          child: CircleAvatar(
            backgroundColor: kIndigoBlueColor,
          )),
    );
  }
}
