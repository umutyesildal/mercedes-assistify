import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    this.isError,
    this.errorText,
    required this.labelText,
    required this.onChangeCallback,
    this.isObsecure,
    Key? key,
  }) : super(key: key);
  final bool? isError;
  final String? errorText;
  final String labelText;
  final void Function(String input) onChangeCallback;
  final bool? isObsecure;

  @override
  _AuthFieldState createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool? isItObsecure;
  @override
  void initState() {
    super.initState();
    isItObsecure = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isItObsecure!,
      decoration: InputDecoration(
        /* suffixIcon: isItObsecure!
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isItObsecure = isItObsecure!;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
              )
            : null, */
        errorText: widget.isError! ? widget.errorText : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(
            style: BorderStyle.solid,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Theme.of(context).primaryIconTheme.color),
      ),
      onChanged: widget.onChangeCallback,
    );
  }
}
