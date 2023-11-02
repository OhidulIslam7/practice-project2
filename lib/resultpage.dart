import 'package:flutter/material.dart';
import 'package:untitled2/theame.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  const ResultPage({Key? key, required this.height, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('YOUR RESULT'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Result(height: height, weight: weight),
    );
  }
}

class Result extends StatefulWidget {
  final int height;
  final int weight;

  const Result({Key? key, required this.height, required this.weight}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late String comment;
  late String headline;
  late String bmiValue;

  @override
  void initState() {
    super.initState();
    calculateBMI();
  }

  void calculateBMI() {
    double bmi = (widget.weight / (widget.height * widget.height)) * 10000;

    if (bmi < 18.5) {
      comment = "You are underweight.";
      headline = "UNDERWEIGHT";
    } else if (bmi >= 18.5 && bmi < 25) {
      comment = "You are at a healthy weight.";
      headline = "NORMAL";
    } else if (bmi >= 25 && bmi <= 29.99) {
      comment = "You are overweight.";
      headline = "OVERWEIGHT";
    } else {
      comment = "You are obese.";
      headline = "OBESE";
    }

    bmiValue = bmi.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(headline, style: headlines),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('$bmiValue', style: resultNumber),
                ),
                Column(
                  children: <Widget>[
                    const Text('Normal BMI range:', style: TextStyle(fontSize: 16)), // Specify font size
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18.5 - 25 kg/m²", style: headlines),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(comment, style: headlines),
    )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: primaryButtonColor,
            margin: const EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text('RE-CALCULATE', style: primaryButtonStyle),
            ),
          ),
        ),
      ],
    );
  }
}
