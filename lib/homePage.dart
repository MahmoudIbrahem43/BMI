import 'dart:math';
import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Body Mass Index')),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customGenger(context, 'Male'),
                  customGenger(context, 'Female'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            heightVal.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              'cm',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          )
                        ],
                      ),
                      Slider(
                        value: heightVal,
                        onChanged: (val) {
                          setState(() {
                            heightVal=val;
                          });
                        },
                        min: 90,
                        max: 170,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customContainer(context, 'Age'),
                  customContainer(context, 'Weight'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  var result = weight / pow(heightVal / 100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              result: result, isMale: isMale, age: age)));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        double.infinity,
                        MediaQuery.of(context).size.height /
                            16) // put the width and height you want
                    ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  GestureDetector customGenger(BuildContext context, String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = (gender == 'Male') ? true : false;
        });
      },
      child: Container(
        height: 160,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                (isMale && gender == 'Male') || (!isMale && gender == 'Female')
                    ? Colors.teal
                    : Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gender == 'Male'
                ? const Icon(Icons.male)
                : const Icon(Icons.female),
            const SizedBox(
              height: 12,
            ),
            Text(gender, style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ),
    );
  }

  Container customContainer(BuildContext context, String type) {
    return Container(
      height: 160,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(type == 'Age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 12,
            ),
            Text(type == 'Age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age++ : weight++;
                    });
                  },
                  heroTag: type == 'Age' ? 'age++' : 'weight++',
                  mini: true,
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age-- : weight--;
                    });
                  },
                  heroTag: type == 'Age' ? 'age--' : 'weight--',
                  mini: true,
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
