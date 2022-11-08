import 'package:flutter/material.dart';

class PasswordTxt extends StatefulWidget {
  String hintTxt, labelText;
  TextInputAction Action;
  TextInputType keyBoardType;
  TextEditingController control;
  String? Function(String?)? validate;
  var icon;
  Function()? ontap;
  bool secured;
  PasswordTxt(
      {super.key, required this.control,
      this.validate,
        required this.secured,
      required this.icon,
      required this.ontap,
      required this.Action,
      required this.hintTxt,
      required this.keyBoardType,
      required this.labelText});

  @override
  _PasswordTxtState createState() => _PasswordTxtState();
}

class _PasswordTxtState extends State<PasswordTxt> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorHeight: 20,
        obscureText: widget.secured,
        controller: widget.control,
        validator: widget.validate,
        cursorColor: Colors.orange,
        textInputAction: widget.Action,
        keyboardType: widget.keyBoardType,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: widget.ontap,
            child: Icon(widget.icon,color: Colors.orange,),
          ),
          hintText: widget.hintTxt,
          floatingLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15),
          labelText: widget.labelText,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.orange)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black12, width: 2)),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(20),
          //     borderSide: BorderSide(color: Colors.orange)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        ));
  }
}
