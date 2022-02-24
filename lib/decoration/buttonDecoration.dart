import 'package:flutter/material.dart';

class ButtonDecoration extends StatefulWidget {
  const ButtonDecoration({Key? key, this.onPressed, this.buttonTitle='',this.buttonIcon, this.fixedSize}) : super(key: key);
  final void Function()? onPressed;
  final String buttonTitle;
  final IconData? buttonIcon;
  final Size? fixedSize;

  @override
  State<ButtonDecoration> createState() => _ButtonDecorationState();
}

class _ButtonDecorationState extends State<ButtonDecoration> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const  Color(0xff104c91),
        onPrimary: const Color(0xffF4ECDF),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        fixedSize: widget.fixedSize,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(widget.buttonTitle ,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
          Icon(widget.buttonIcon)
        ],
      ),
      onPressed: widget.onPressed  ,
    );
  }
}

