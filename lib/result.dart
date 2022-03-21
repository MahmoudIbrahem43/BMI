import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPharase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'Over Weight';
    } else if (result >= 18 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),

        iconTheme: IconThemeData(color: Colors.white, size: 25),
        
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Gender : ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text('Result : ${result.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headline3),
              Text(
                'Healthiness : ${resultPharase}',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              Text(
                'Age : ${age}',
                style: Theme.of(context).textTheme.headline3,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
