import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aimbooster/aimbooster.dart';
import 'package:flutter_app_aimbooster/aimbooster_without_penalty.dart';

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  double ballSize = 75;
  double ballColorValue = 0;
  double ballCount = 3;
  Color ballColor = Colors.blue;
  bool withPenalty = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aim Booster - Menu'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(200, 100, 200, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ball Size',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '  (Preferred 75)',
                      style:
                          TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Slider(
                  value: ballSize,
                  onChanged: (newBallSize) {
                    setState(() {
                      ballSize = newBallSize;
                    });
                  },
                  divisions: 4,
                  label: '$ballSize',
                  min: 50,
                  max: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Ball Color',
                  style: TextStyle(fontSize: 20),
                ),
                Slider(
                  value: ballColorValue,
                  onChanged: (newBallColor) {
                    setState(() {
                      ballColorValue = newBallColor;
                      switch (ballColorValue.toInt()) {
                        case (0):
                          ballColor = Colors.blue;
                          break;
                        case (1):
                          ballColor = Colors.pinkAccent;
                          break;
                        case (2):
                          ballColor = Colors.green;
                          break;
                      }
                    });
                  },
                  activeColor: ballColor,
                  divisions: 2,
                  min: 0,
                  max: 2,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ball Count',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '  (Preferred 3)',
                      style:
                          TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                Slider(
                  value: ballCount,
                  onChanged: (newBallCount) {
                    setState(() {
                      ballCount = newBallCount;
                    });
                  },
                  divisions: 4,
                  label: '${ballCount.toInt()}',
                  min: 1,
                  max: 5,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '  (Without Miss Penalty)',
                      style:
                      TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                    Switch(
                        value: withPenalty,
                        onChanged: (value) {
                          setState(() {
                            withPenalty = value;
                          });
                        }),
                    Text(
                      '  (With Miss Penalty)',
                      style:
                      TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(withPenalty) {
                        Navigator.push(context, MaterialPageRoute(builder: (c) {
                          return MyApp(
                            ballCount: ballCount.toInt(),
                            ballSize: ballSize,
                            ballColor: ballColor,
                          );
                        }));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (c) {
                          return AimBoosterWithoutPenalty(
                            ballCount: ballCount.toInt(),
                            ballSize: ballSize,
                            ballColor: ballColor,
                          );
                        }));
                      }
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 50,
                ),
                Divider(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Preview',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 50,
                ),
                ClipOval(
                  child: Material(
                    color: ballColor, // Button color
                    child: InkWell(
                        child: GestureDetector(
                      child: SizedBox(width: ballSize, height: ballSize),
                    )),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Saman719',
                  style: TextStyle(color: Color.fromRGBO(167, 165, 165, 1.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
