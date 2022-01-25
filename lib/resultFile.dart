import 'package:flutter/material.dart';
import 'ConatinerFile.dart';
import 'input_page.dart';
import 'Constant.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({@required this.bmiresults,@required this.interpretation,@required this.resultsText});
  final String bmiresults;
  final String resultsText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child:Container(
          child: Center(
            child: Text("Your Results",style: TextStyle(fontWeight:FontWeight.w900,fontSize: 30),),
      ),
      )),
          Expanded(
            flex: 5,
            child: RepeatContainerCode(
              color: ActiveColor,
              cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  Text(resultsText,style:klableStyle,textAlign: TextAlign.center,),
                  Text(bmiresults,style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                  Text(interpretation,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>InputPage()));
            },
            child: Container(
              alignment: Alignment.center,
              child:Text("ReCalculate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,),
          ),),
        ],
      ),
    );
  }
}
