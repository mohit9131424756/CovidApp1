import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'launchingpage.dart';
import 'daily1.dart';
import 'dashboard1.dart';

class Firstpage extends StatelessWidget {
  var cameras;
  Firstpage(this.cameras);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Firstpage1(),
    );
  }
}
class Firstpage1 extends StatefulWidget
{
  @override
  _Firstpage1 createState() => _Firstpage1();
}
class _Firstpage1 extends State<Firstpage1>
{
  @override
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
    final TextSection=new Container(
      child: new Text('Government Guidelines'),

    );
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          threeButtonsSection,
          SizedBox(
            height: 30,
          ),
          Text('Government Guidelines',style:TextStyle(fontSize: 35),textAlign: TextAlign.center,),
          SizedBox(
            height: 35,
          ),
          Container(color:Colors.green,
            child: Text('Wash your hands for atleast 20 seconds',

              style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserrat'
              )
          ),),
          SizedBox(
            height: 35,
          ),
          Container(color:Colors.green,
            child: Text('Wear a face mask compulsorily while going out of your home',

                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserrat'
                )
            ),),
          SizedBox(
            height: 35,
          ),
          Container(color:Colors.green,
            child: Text('Avoid touching your eyes,nose or mouth',

                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserrat'
                )
            ),),
          SizedBox(
            height: 35,
          ),
          Container(color:Colors.green,
            child: Text('If you develop a fever,cough or difficulty breathing,seek medical care as soon as possible',

                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserrat'
                )
            ),),
          SizedBox(
            height: 35,
          ),
          Container(color:Colors.green,
            child: Text('Avoid close contact with anyone with flu-like symptomps.',

                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserrat'
                )
            ),),
          SizedBox(
            height: 35,
          ),
          Container(color:Colors.green,
            child: Text('Avoid travelling as much as possible.',

                style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserrat'
                )
            ),),
          SizedBox(
            height: 35,
          ),

          Container(

          )
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Item 1',
                style: TextStyle( fontSize:30,fontWeight :FontWeight.bold),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2',
                style: TextStyle( fontSize:30,fontWeight :FontWeight.bold),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

    );
  }

}
