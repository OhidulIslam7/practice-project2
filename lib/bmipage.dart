import 'package:flutter/material.dart';
import 'package:untitled2/resultpage.dart';
import 'package:untitled2/theame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('BMI Calculator')),
        body: const BmiPage(),
      ),
    );
  }
}

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int age = 17;
  int weight = 50;
  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;
  bool isMaleSelected = false; // Track Male container selection
  bool isFemaleSelected = false; // Track Female container selection

  ageIncrement() {
    setState(() {
      age++;
    });
  }

  ageDecrement() {
    setState(() {
      age--;
    });
  }

  weightIncrement() {
    setState(() {
      weight++;
    });
  }

  weightDecrement() {
    setState(() {
      weight--;
    });
  }

  void selectMaleContainer() {
    setState(() {
      isMaleSelected = true;
      isFemaleSelected = false;
    });
  }

  void selectFemaleContainer() {
    setState(() {
      isFemaleSelected = true;
      isMaleSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color to black
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text("BMI Calculator"),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: selectMaleContainer,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: isMaleSelected ? const Color(0xFF9fc5e8) : primary, // Change color when selected
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/male.png', height: 100.0, width: 100.0),
                        const SizedBox(height: 20.0),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 24,
                            color: isMaleSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: selectFemaleContainer,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: isFemaleSelected ? const Color(0xFFf9cb9c) : primary, // Change color when selected
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/female.png', height: 100.0, width: 100.0),
                        const SizedBox(height: 20.0),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 24,
                            color: isFemaleSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: primary
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text('HEIGHT',style: headlines),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$height", style: boldNumber),
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      activeColor: Colors.orangeAccent,
                      inactiveColor: Colors.black,
                      onChanged: ( double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '$newValue.round()';
                      }
                  )
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:primary
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text('WEIGHT',style: headlines),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$weight", style: boldNumber),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: weightDecrement,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.orangeAccent
                              ),
                              child: Center(
                                child: Text("-", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          ),

                          Container(
                            height: 40.0,
                            width: 40.0,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.orangeAccent
                            ),
                            child: InkWell(
                              onTap: weightIncrement,
                              child: Center(
                                child: Text("+", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text('AGE',style: headlines),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$age",style: boldNumber),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: ageDecrement,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.orangeAccent
                              ),
                              child: Center(
                                child: Text("-", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          ),

                          Container(
                            height: 40.0,
                            width: 40.0,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.orangeAccent
                            ),
                            child: InkWell(
                              onTap: ageIncrement,
                              child: Center(
                                child: Text("+", style: secondaryButtonColorStyle,),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              )
            ],
          ),



          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: height,weight: weight,))),
            child: Container(
              color: primaryButtonColor,
              margin: const EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text('CALCULATE BMI', style: primaryButtonStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

