import 'package:flutter/material.dart';
class RepeatContainerCode extends StatelessWidget {

  RepeatContainerCode({
    @required this.color,this.cardwidget,this.onpressed});
  final Color color;
  final Widget cardwidget;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onpressed();
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardwidget,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}