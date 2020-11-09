// TODO Implement this library.
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'launchingpage.dart';
import 'daily1.dart';
import 'dashboard1.dart';
import 'pag1.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Dashboard1(),
    );
  }
}
class Dashboard1 extends StatefulWidget
{
  @override
  _Dashboard1 createState() => _Dashboard1();
}
class _Dashboard1 extends State<Dashboard1> {
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


                Expanded(child: Container(
                  color:Colors.green,
                  height: 40,
                  child: Text('Dashboard',
                      textAlign: TextAlign.center,
                      style:TextStyle(

                          fontSize: 25,backgroundColor:Colors.green,
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

        ],

    ),
    );
  }
}
