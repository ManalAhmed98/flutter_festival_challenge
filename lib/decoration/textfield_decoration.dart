import 'package:flutter/material.dart';

class TextFieldDecoration extends StatefulWidget {

  const TextFieldDecoration({Key? key, this.label, this.onChanged, this.textInputAction}) : super(key: key);
  @override
  _TextFieldDecorationState createState() => _TextFieldDecorationState();
  final String? label;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
}

class _TextFieldDecorationState extends State<TextFieldDecoration> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
      textDirection: TextDirection.rtl,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black45),
        labelText: widget.label,
      ),
      style: const TextStyle(
        color:  Color(0xff1f8ac0),
        fontSize: 16
      ),
        textInputAction: widget.textInputAction,
      keyboardType: TextInputType.name,
    );
  }
}

