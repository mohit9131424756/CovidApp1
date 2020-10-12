import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pag1.dart';
class lpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String , WidgetBuilder>{
        //'/signup' : (BuildContext context) => new SignupPage(),
        '/firstpage1' :(BuildContext context) => new Firstpage1(),
        '/launchingpage' :(BuildContext context) => new lpage1(),
      },
      home: new lpage1(),
    );
  }
}
class lpage1 extends StatefulWidget
{
  @override
  _lpage1 createState() => _lpage1();
}
class _lpage1 extends State<lpage1>
{
  @override
  int selectedRadioTile1;
  int selectedRadioTile2;
  int selectedRadioTile3;
  int selectedRadioTile4;
  int selectedRadioTile5;
  void initState()
  {
    super.initState();
    selectedRadioTile1=2;
    selectedRadioTile2=2;
    selectedRadioTile3=2;
    selectedRadioTile4=2;
    selectedRadioTile5=2;

  }
  setSelectedRadioTile(int val)
  {
    setState(() {
      selectedRadioTile1=val;

    });
  }
  setSelectedRadioTile5(int val)
  {
    setState(() {
      selectedRadioTile5=val;

    });
  }
  setSelectedRadioTile2(int val)
  {
    setState(() {
      selectedRadioTile2=val;

    });
  }
  setSelectedRadioTile3(int val)
  {
    setState(() {
      selectedRadioTile3=val;

    });
  }
  setSelectedRadioTile4(int val)
  {
    setState(() {
      selectedRadioTile4=val;

    });
  }
  Widget build(BuildContext context) {
    Widget buildButton(IconData icon,String buttonTitle) {
      final Color tintColor=Colors.green;
      return new Column(
        children: <Widget> [
          new Icon(icon,color:tintColor,size: 40,),
          new Container(
              child:new Text(buttonTitle,style:new TextStyle(fontSize: 16.0,
                  fontWeight:FontWeight.w600))
          )
        ],
      );
    }
    return new Scaffold(
        resizeToAvoidBottomPadding: false,

        body:
        Column(
          children: [
            Container
              (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(

                    height: 60.0,
                    child: Material(

                      //borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent ,
                        color: Colors.green,
                        child:GestureDetector(
                          child: Center(
                            child: Text('Hello User!',
                                style:TextStyle(
                                    color: Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontFamily:'Montserrat'
                                )),



                          ),
                        )
                    ),

                  ),
                ],
              ),
            ),
            Container(

              padding: EdgeInsets.only(left:20,right:20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[


                    SizedBox(
                      height: 10,
                    ),
                    Text('Do you see Symptoms of corona?',
                        style:TextStyle(

                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monserrat'
                        )
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile1,
                      title: Text("Yes"),
                      onChanged: (val){
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile1,
                      title: Text("No"),
                      onChanged: (val){
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.green,
                    ),
                    //2nd question
                    Container(

                      child: Text('Have you been in contact with any covid patient ?',
                          style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Monserrat'
                          )
                      ),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile2,
                      title: Text("Yes"),
                      onChanged: (val){
                        setSelectedRadioTile2(val);
                      },
                      activeColor: Colors.red,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile2,
                      title: Text("No"),
                      onChanged: (val){
                        setSelectedRadioTile2(val);
                      },
                      activeColor: Colors.green,
                    ),
                    //3rd question
                    Text('Have you travelled through any containment zone ?',
                        style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monserrat'
                        )
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile3,
                      title: Text("Yes"),
                      onChanged: (val){
                        setSelectedRadioTile3(val);
                      },
                      activeColor: Colors.red,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile3,
                      title: Text("No"),
                      onChanged: (val){
                        setSelectedRadioTile3(val);
                      },
                      activeColor: Colors.green,
                    ),
                    //4rth question
                    Text('Have you been to any other city in last 25 days?',
                        style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monserrat'
                        )
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile4,
                      title: Text("Yes"),
                      onChanged: (val){
                        setSelectedRadioTile4(val);
                      },
                      activeColor: Colors.red,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile4,
                      title: Text("No"),
                      onChanged: (val){
                        setSelectedRadioTile4(val);
                        selected:true;
                      },
                      activeColor: Colors.green,
                    ),
                    Container(
                      alignment: Alignment(1,0),
                      padding: EdgeInsets.only(top:15,left:50,right: 50),
                      height:60,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                            border:Border.all(
                                color:Colors.black,
                                style:BorderStyle.solid,
                                width: 1.0
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),


                          ),

                          child:GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context)=> Firstpage()
                              ));
                            },
                            child: Center(
                              child: Text('PROCEED',
                                  style:TextStyle(
                                      color: Colors.black,
                                      fontWeight:FontWeight.bold,
                                      fontFamily:'Montserrat'

                                  )),


                            ),
                          )
                      ),

                    ),


                  ]

              ),

            ),
          ],
        )
    );
  }

}