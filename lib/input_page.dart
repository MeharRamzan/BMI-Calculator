import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconFile.dart';
import 'resultFile.dart';
import 'ConatinerFile.dart';
import 'Constant.dart';
import 'calculatorBrain.dart';


enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = DeactiveColor;
  Color Femalecolor = DeactiveColor;
 Gender selectedGender;
 int sliderheight=180;
 int sliderweight=60;
 int sliderAge=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: RepeatContainerCode(
                      onpressed:() {
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      color: selectedGender==Gender.male?ActiveColor:DeactiveColor,
                    cardwidget: RepeatTextandIcon(icondata: FontAwesomeIcons.male,lable: "MALE",),
                    ),

                ),
                Expanded(
                    child: RepeatContainerCode(
                      onpressed:() {
                        setState(() {
                          selectedGender=Gender.female;
                        });
                      },
                      color: selectedGender==Gender.female?ActiveColor:DeactiveColor,
                    cardwidget: RepeatTextandIcon(icondata: FontAwesomeIcons.female,lable: "FEMALE",),),
                ),
              ],
            ),
          ),
          Expanded(
            child: RepeatContainerCode(color: Color(0xFF1D1E33),
            cardwidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT",style: klableStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderheight.toString(),
                      style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),
                    ),
                    Text("cm",style: klableStyle,)
                  ],
                ),
                Slider(value: sliderheight.toDouble(),
                  min: 110,
                  max: 220,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                  setState(() {
                    sliderheight=newValue.round();
                  });
                  },
                )
              ],
            ),
            )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RepeatContainerCode(
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",style: klableStyle,),
                        Text(sliderweight.toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900 ),)
                        ,Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundicon(
                              icondata: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  sliderweight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Roundicon(icondata: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  sliderweight++;
                                });
                              },),
                          ],
                        )
                      ],
                    ),
                    color: Color(0xFF1D1E33),)
                ),
                Expanded(
                  child: RepeatContainerCode(
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",style: klableStyle,),
                        Text(sliderAge.toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900 ),)
                        ,Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundicon(
                              icondata: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  sliderAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Roundicon(icondata: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  sliderAge++;
                                });
                              },),
                          ],
                        )
                      ],
                    ),
                    color: Color(0xFF1D1E33),)
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain cal=CalculatorBrain(height: sliderheight,weight: sliderweight);
              Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultsScreen(
                bmiresults: cal.calulateBmi(),
                resultsText: cal.getReults(),
                interpretation: cal.getInterpretation(),

              )));
            },
            child: Container(
                alignment: Alignment.center,
              child:Text("Calculate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
              color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 60,),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class Roundicon extends StatelessWidget {
  Roundicon({@required this.icondata,this.onpress});
  final IconData icondata;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icondata),
      onPressed: onpress,
      elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          height: 46 ,
          width: 46
        ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }

}
