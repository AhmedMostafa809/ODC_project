import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class EmailTxt extends StatefulWidget {
  String hintTxt, labelText;
  TextInputAction Action;
  TextInputType keyBoardType;
  TextEditingController control;
  String? Function(String?)? validate;
  var formater;

  EmailTxt(
      {
        this.formater,
        required this.control,
        this.validate,
        required this.Action,
        required this.hintTxt,
        required this.keyBoardType,
        required this.labelText});

  @override
  _EmailTxtState createState() => _EmailTxtState();
}

class _EmailTxtState extends State<EmailTxt> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: widget.formater,
      cursorHeight: 20,
      controller: widget.control,
      validator: widget.validate,
      cursorColor: Colors.orange,
      textInputAction: widget.Action,
      keyboardType: widget.keyBoardType,
      decoration: InputDecoration(
        hintText: widget.hintTxt,
        labelText: widget.labelText,
        floatingLabelStyle: const TextStyle(color: Colors.orange, fontSize: 15),

        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.orange)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black12,width: 2)),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(20),
        //     borderSide: BorderSide(color: Colors.orange)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical:20 ),
      )
    );
  }
}
