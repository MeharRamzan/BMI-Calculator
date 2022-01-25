import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calulateBmi()
  {
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getReults()
  {
    if(_bmi>=25)
      {
        return "OverWeight";
      }
    else if(_bmi>18.5)
      {
        return "Normal";
      }
    else
      {
        return 'Under Weight';
      }
  }

  String getInterpretation()
  {
    if(_bmi>=25)
    {
      return "You have a higher than normal Body weight.Try some Exercise!";
    }
    else if(_bmi>18.5)
    {
      return "You have a Normal body weight. Good Job!";
    }
    else
    {
      return 'You have a lower than normal Body weight.You can eat a bit!';
    }
  }
}