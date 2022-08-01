// ignore_for_file: camel_case_types

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const bmi());
  }
}

const _activecolor = Colors.blueAccent;
const _inactivecolor = Color(0xFF263238);

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  int _currentValue = 0;
  int _counter = 1;
  int _wcounter = 1;
  double height = 180;
  String result = "";
  String resultdata = "";
  double bmi = 10;

  void _add() => setState(() {
      _counter++;
    });

  void _remove() => setState(() {
      if(_counter!=1){
        _counter--;
      }
    });

  void _weightadd()=> setState(() {
      _wcounter++;
    });

  void _weightremove()=> setState(() {
      if(_wcounter!=1){
        _wcounter--;
      }
    });

  Color maleboxcolor = _activecolor;
  Color femaleboxcolor = _inactivecolor;

  void _updatecolorbox(int gender){
    if (gender == 1) {
      if(maleboxcolor == _inactivecolor){
        maleboxcolor = _activecolor;
        femaleboxcolor = _inactivecolor;
      }else{
        maleboxcolor = _inactivecolor;
        femaleboxcolor = _activecolor;
      }
    }else{
      if(femaleboxcolor == _inactivecolor){
        femaleboxcolor = _activecolor;
        maleboxcolor = _inactivecolor;
      }else{
        femaleboxcolor = _inactivecolor;
        maleboxcolor = _activecolor;
      }
    }
  }

  String calculatebmi(int _currentValue,int _wcounter){
     bmi = _wcounter / pow(_currentValue/100 , 2);
        return bmi.toStringAsFixed(1);
  }

  String getdata(int bmi){
    if(bmi >= 25){
      return "higher than normal body";
    }else if(bmi > 18){
      return " normal body";
    }else{
      return "lower than normal body";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _updatecolorbox(1);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.fromLTRB(2, 20, 2, 10),
                        decoration: BoxDecoration(
                            color: maleboxcolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.male_rounded,
                              size: 100,
                              color: Colors.white,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _updatecolorbox(2);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.fromLTRB(2, 20, 2, 10),
                        decoration: BoxDecoration(
                            color: femaleboxcolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.female_rounded,
                              size: 100,
                              color: Colors.white,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      height: 200,
                      width: 370,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Text(
                                  'HEIGHT IN CENTIMETER',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(30),
                                  child: Column(
                                    children: [
                                      Text(
                                        _currentValue.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Slider(
                                          value: _currentValue.toDouble(),
                                          min: 0,
                                          max: 200,
                                          activeColor: Colors.red,
                                          inactiveColor: Colors.black,
                                          thumbColor: Colors.redAccent,
                                          onChanged: (value) {
                                            setState(() {
                                              _currentValue = value.toInt();
                                            });
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.fromLTRB(10, 20, 2, 10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const Text(
                                'WEIGHT',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                '$_wcounter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      onPressed: _weightremove,
                                      child: const Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      onPressed: _weightadd,
                                      child: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const Text(
                                'AGE',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                '$_counter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      onPressed: _remove,
                                      tooltip: 'Decrement',
                                      child: const Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      onPressed: _add,
                                      child: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(50),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.teal),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: const BorderSide(color: Colors.black)))
                          ),
                            onPressed: (){
                            setState(() {

                            });

                            result = calculatebmi(_currentValue, _wcounter);
                            resultdata = getdata(bmi.toInt());
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('$result',style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white
                                            ),),
                                            Text('$resultdata',style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.redAccent
                                            ),)
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: const Text('CALCULATE')
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

