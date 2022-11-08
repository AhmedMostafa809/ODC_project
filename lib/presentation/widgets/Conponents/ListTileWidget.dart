import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LisTileWidget extends StatelessWidget {
  // IconData icon;
  Function()? ontap;
  String text;
  LisTileWidget({required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: ListTile(
        title: Text(text),
        onTap: ontap,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
