import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindemo1/main.dart';
import 'pag1.dart';
import 'launchingpage.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  var cameras;
  LoginPage(this.cameras);
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String k;
  FormType _formType = FormType.login;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool validateAndSave() {
    final form = formKey.currentState;
    //Form Validation done here.
    if (form.validate()) {
      form.save();
      //print('Form is valid. Email: $_email Password: $_password');
      return true;
    }
    //else {
    //  print('Form is Invalid.');
    //}
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          // ignore: deprecated_member_use
          FirebaseUser user = (await _auth.signInWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
          print('Signed In: ${user.uid}');
        } else {
          // ignore: deprecated_member_use
          FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
          print('Registered User: ${user.uid}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Login App'),
//      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
//        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //Used to stretch a button of its parent properties.
            children: buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
        obscureText: true,
      ),
    ];
  }

   buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child : Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: Text(
                      'Hello',
                      style: TextStyle( fontSize:80,fontWeight :FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 175, 0, 0),
                    child: Text(
                      'There',
                      style: TextStyle( fontSize:80,fontWeight :FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(240, 175, 0, 0),

                    child: Text(
                      '.',
                      style: TextStyle( fontSize:80,fontWeight :FontWeight.bold,color:Colors.green),

                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35,left:20,right:20),
              child: Column(
                children: <Widget>[

                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',

                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey,

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                        )


                    ),

                  ),
                  SizedBox(
                      height:20.0
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                    onSaved: (value) => _password = value,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey,

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                        )


                    ),

                  ),
//                  SizedBox(height:5.0),
//                  Container(
//                    alignment: Alignment(1,0),
//                    padding: EdgeInsets.only(top:15,left:20),
//                    child:InkWell(
//                      child: Text('Forgot Password',
//                        style:TextStyle(color: Colors.green,
//                            fontWeight:FontWeight.bold,
//                            fontFamily: 'Montserrat',
//                            decoration: TextDecoration.underline
//
//                        ),
//                      ),
//                    ),
//                  ),
                  SizedBox
                    (
                    height: 60.0,
                  ),
//                  RaisedButton(
//                    child: Text('logout'),
//                    onPressed: (){
//                       FirebaseAuth.instance.signOut();
//                    },
//                  ),

                  Container(
                    height: 60.0,

                    child: RaisedButton(

                      onPressed :()
                      { validateAndSubmit();
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User user) {
                          if (user == null) {
                            print('User is currently signed out!');

                          } else {
//

                            // Find the Scaffold in the widget tree and use
                            // it to show a SnackBar.

                            //sleep(const Duration(seconds: 5));
                            print('User is signed in!');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => lpage(cameras)),
                                    (Route<dynamic> route) => false);

                          }
                        });
                      },
//                     onPressed: validateAndSubmit,

                        color: Colors.green,
                        elevation: 7.0,


                          child: Center(
                            child: Text('LOGIN',
                                style:TextStyle(
                                    color: Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontFamily:'Montserrat'

                                )),


                          ),

                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                ],

              ),
            ),
//            SizedBox(
//              height: 40,
//            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('New Here ?',
                  style: TextStyle(
                      fontFamily: 'Montserrat'
                  ),
                ),
                SizedBox(width: 5,),

              ],
            )



          ],

        ),

        FlatButton(
          child: Text(
            'Create new account',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child : Stack(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.fromLTRB(15, 50, 0, 0),
                    child: Text(
                      'SIGNUP',
                      style: TextStyle( fontSize:80,fontWeight :FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(320, 50, 0, 0),

                    child: Text(
                      '.',
                      style: TextStyle( fontSize:80,fontWeight :FontWeight.bold,color:Colors.green),

                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35,left:20,right:20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'First Name can\'t be empty' : null,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey,

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                        )


                    ),

                  ),
                  SizedBox(height:20),
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Last Name can\'t be empty' : null,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey,

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                        )


                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey,

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                        )


                    ),

                  ),
                  SizedBox(
                      height:20.0
                  ),

                  TextFormField(
                    validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                    onSaved: (value) => _password = value,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color:Colors.grey,

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                        )


                    ),

                  ),


                  SizedBox
                    (
                    height: 60.0,
                  ),
                   Container(
                     height: 60,
                     child: RaisedButton(
                       onPressed: validateAndSubmit,
//                        borderRadius: BorderRadius.circular(20.0),
//                        shadowColor: Colors.greenAccent ,
                       color: Colors.green,
                       elevation: 7.0,


                       child: Center(
                         child: Text('SIGNUP',
                             style:TextStyle(
                                 color: Colors.white,
                                 fontWeight:FontWeight.bold,
                                 fontFamily:'Montserrat'

                             )),


                       ),
                     ),
                   ),





                  SizedBox(
                      height:20
                  ),
//                  Container(
//                    height: 60.0,
//                    child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        shadowColor: Colors.greenAccent ,
//                        color: Colors.green,
//                        elevation: 7.0,
//                        child:GestureDetector(
//                          onTap: (){
////                            Navigator.push(context,MaterialPageRoute(
////                                builder: (context)=> MyApp()
////                            ));
//                          },
//                          child: Center(
//                            child: Text('LOGIN',
//                                style:TextStyle(
//                                    color: Colors.black,
//                                    fontWeight:FontWeight.bold,
//                                    fontFamily:'Montserrat'
//
//                                )),
//
//
//                          ),
//                        )
//                    ),
//                  ),
                FlatButton(
                 child: Text(
                  'Have an Account? Login',
                  style: TextStyle(fontSize: 20.0),
                    ),
                     onPressed: moveToLogin,
                      ),

                  SizedBox(
                    height: 20.0,
                  ),

                ],

              ),
            ),
//          SizedBox(
//            height: 40,
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text('New Here ?',
//                style: TextStyle(
//                    fontFamily: 'Montserrat'
//                ),
//              ),
//              SizedBox(width: 5,),
//              InkWell(
//                onTap:(){} ,
//                child: Text('Register',
//                  style:TextStyle(
//                      color: Colors.green,
//                      fontFamily: 'Monserrat',
//                      fontWeight:FontWeight.bold,
//                      decoration: TextDecoration.underline
//
//
//
//                  ),
//                ),
//              ),
//            ],
//          )
//
//
//
          ],



      )
//        RaisedButton(
//          child: Text(
//            'Create an Account',
//            style: TextStyle(fontSize: 20.0),
//          ),
//          onPressed: validateAndSubmit,
//        ),
//        FlatButton(
//          child: Text(
//            'Have an Account? Login',
//            style: TextStyle(fontSize: 20.0),
//          ),
//          onPressed: moveToLogin,
//        )
      ];
    }
  }
}
