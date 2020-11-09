// TODO Implement this library.
import 'package:logindemo1/camera.dart';

import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'launchingpage.dart';
import 'daily1.dart';
import 'dashboard1.dart';
import 'pag1.dart';

class daily extends StatelessWidget {
  var cameras;
  daily(this.cameras);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new daily1(),
    );
  }
}
class daily1 extends StatefulWidget
{
  @override
  _daily1 createState() => _daily1();
}
class _daily1 extends State<daily1> {
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
    Widget buildButton(IconData icon,String buttonTitle,t)
    {
      final Color tintColor=Colors.green;
      return new Column(
        children: <Widget> [

          new Icon(icon,color:tintColor,size: 40,),
          new Container(
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=> t
                  ));
                },
                child:new Text(buttonTitle,style:new TextStyle(fontSize:  16.0,
                    fontWeight:FontWeight.w600)
                ),




              )

          )
        ],
      );

    }
    Widget threeButtonsSection =new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //new Text("Button 1",style:new TextStyle(fontSize:16.0)),

          buildButton(Icons.home, "Your  Status",Firstpage(cameras)),
          buildButton(Icons.assessment, "Daily assessment",daily(cameras)),
          buildButton(Icons.dashboard, "Dashboard",Dashboard()),
        ],
      ),
    );
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          threeButtonsSection,
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Row(

    children: <Widget>[

                Expanded(child:Container(

                  child: Text('SPO2',
                      style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

                Expanded(child: Container(
                  color:Colors.green,
                  child: Text('',
                      style:TextStyle(
                          fontSize: 30,backgroundColor:Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Row(

              children: <Widget>[

                Expanded(child:Container(

                  child: Text('Heart Rate',
                      style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

                Expanded(child: Container(
                  color:Colors.green,
                  child: Text('',
                      style:TextStyle(
                          fontSize: 30,backgroundColor:Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Row(

              children: <Widget>[

                Expanded(child:Container(

                  child: Text('Breathing Rate',
                      style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

                Expanded(child: Container(
                  color:Colors.green,
                  child: Text('',
                      style:TextStyle(
                          fontSize: 30,backgroundColor:Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Row(

              children: <Widget>[

                Expanded(child:Container(

                  child: Text('Temperature',
                      style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

                Expanded(child: Container(
                  color:Colors.green,
                  child: Text('',
                      style:TextStyle(
                          fontSize: 30,backgroundColor:Colors.green,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monserrat'
                      )
                  ),
                ),),

              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Do you have cough and cold?',
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

            child: Text('Do you have any respiratory problem ?',
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
          ListTile(
            title: Row(
              children: <Widget>[

                Expanded(child:Container(height: 50,child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> CameraScreen(cameras)));},
                  child: Text("Measure"),color: Colors.green,textColor: Colors.white,))),

                Expanded(child:Container(height:50,child: RaisedButton(onPressed: () {},child: Text("Get Status"),color: Colors.green,textColor: Colors.white,))),

              ],
            ),
          )
        ],
      ),
    );
  }
}
