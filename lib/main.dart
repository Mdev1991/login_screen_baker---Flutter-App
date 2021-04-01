import 'package:flutter/material.dart';
import 'package:flutter_login_1/constants.dart';
import 'package:flutter_login_1/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: KPrimaryColor,
        scaffoldBackgroundColor: KBackgroundColor,
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: KPrimaryColor,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(.2)),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/perosn.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "BAKING LESSONS\n",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    TextSpan(
                      text: "MASTER THE ART OF BAKING",
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 60, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: KPrimaryColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "START LEARNING",
                          style: Theme.of(context).textTheme.button.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
