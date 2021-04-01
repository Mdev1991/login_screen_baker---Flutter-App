import 'package:flutter/material.dart';
import 'package:flutter_login_1/constants.dart';
import 'package:flutter_login_1/main.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/perosn.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SING IN",
                            style: Theme.of(context).textTheme.display1,
                          ),
                          Text(
                            "SING UP",
                            style: Theme.of(context).textTheme.button,
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.alternate_email,
                                color: KPrimaryColor,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  validator: _validateLogin,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:
                                      InputDecoration(hintText: "Email Adress"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.lock,
                              color: KPrimaryColor,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                validator: _validatePassword,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(hintText: "Password"),
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(.5),
                                ),
                              ),
                              child: Icon(
                                Icons.android_sharp,
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(.5),
                                ),
                              ),
                              child: Icon(
                                Icons.chat,
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: RaisedButton(
                                shape: CircleBorder(),
                                color: KPrimaryColor,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Processing Data')));
                                  }
                                },
                                padding: EdgeInsets.all(16),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _validateLogin(dynamic value) {
  if (value == null || value.isEmpty) {
    return 'Please enter you email';
  }
  return null;
}

String _validatePassword(dynamic value) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  }
  return null;
}
