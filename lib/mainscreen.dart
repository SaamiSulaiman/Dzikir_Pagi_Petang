import 'package:flutter/material.dart';
import 'package:dzikir_pagi_petang/thirdscreen.dart';
import 'secondscreen.dart';
import 'thirdscreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            //
          },
        ),
        title: Text("Dzikir Pagi & Petang App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('data/image/icon.png')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: 300.0,
                  height: 100.0,
                  child: RaisedButton(
                    child: Text(
                      "Dzikir Pagi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Chewy'),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: 300.0,
                  height: 100.0,
                  child: RaisedButton(
                    child: Text(
                      "Dzikir Petang",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Chewy'),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }static const PrimaryColor =  Color(0xFFFFF8DC);
}
