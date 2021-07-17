import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: BMI(),
));
class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  List<bool> _selections = List.generate(2, (_)=> false);
  String Result="";
  String Condition="";
  bool _value = false;
  double val = 0;

  bool _value1 = false;
  double val1= 80;

  bool gender= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                ToggleButtons(
                  fillColor: Colors.blue,
                selectedColor: Colors.white,
                children: <Widget>[

                  Icon(
                      Icons.female,
                      color: Colors.pink,
                      size: 80.0,
                  ),
                  Icon(
                    Icons.male,
                    color: Colors.pink,
                    size: 80.0,
                  ),
                ],
                    isSelected:  _selections,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selections.length; i++) {
                        _selections[i] = i == index;

                      }
                    });
                  },

                ),



              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: <Widget>[
                new  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Text("Weight: $val Kg ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),

                    ),

                       Slider(
                      value: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      min: 0,
                      max: 200,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green[100],
                      label: val.round().toString(),
                      divisions: 10,

                    ),



                  ],

                ),

              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: <Widget>[
                new  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Text("Height: $val1 Cm ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child:
                      Slider(
                        value: val1,
                        onChanged: (value1) {
                          setState(() {
                            val1 = value1;
                          });
                        },
                        min: 80,
                        max: 250,
                        activeColor: Colors.green,
                        inactiveColor: Colors.green[100],
                        label: val1.round().toString(),
                        divisions: 100,
                      ),
                    ),


                  ],

                ),

              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: <Widget>[
                new  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[


                    Text("BMI",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),

                    ),
                    Text("$Result",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    Text("Condition : $Condition",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ],

                ),

              ],
            ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,



        children: <Widget>[

          RaisedButton(
            onPressed: () => calculate(val1,val),
            color: Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text("Calculate"),
          )

        ],
      ),
          ],
        ),
    );

  }
 // Functions Go here
void calculate(double height, double weight){
    double finalresult= weight/(height*height/10000);
    if(finalresult<=18.5){
        Condition="Underweight";
    }
    else if(finalresult>18.5 && finalresult<=25){
      Condition="Healthy";
    }
    else if(finalresult>25 && finalresult<=30){
      Condition="Overweight";
    }
    else{
      Condition="Obesity";
    }

    String bmi=finalresult.toStringAsFixed(2);
    setState(() {
      Result=bmi;
    });
}
}
