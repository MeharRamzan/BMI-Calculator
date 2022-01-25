import 'package:flutter/material.dart';
import 'Constant.dart';
class RepeatTextandIcon extends StatelessWidget {
  RepeatTextandIcon({
    @required this.icondata,this.lable
  });
  final IconData icondata;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icondata,size: 80,),
        SizedBox(height: 15,),
        Text(lable,style:klableStyle,)
      ],
    );
  }
}