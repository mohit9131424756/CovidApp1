import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindemo1/daily1.dart';
import 'package:logindemo1/login_page.dart';
import 'package:logindemo1/main.dart';
import 'pag1.dart';
import 'launchingpage.dart';
import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;
  CameraScreen(this.cameras);

  @override
  State<StatefulWidget> createState() => _CameraScreenState();
}



class _CameraScreenState extends State<CameraScreen> {


  CameraController controller;
  Future<void> _initializeControllerFuture;
  @override
  void initState()

  {
    super.initState();
    controller=new CameraController(widget.cameras[1], ResolutionPreset.high);
    controller.initialize().then((_)
    {
      if(!mounted){
        _initializeControllerFuture = controller.initialize();
        return;
      }
      setState(() {

      });
    }

    );
  }

  @override
  void dispose()
  {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(!controller.value.isInitialized)
    {
      return new Container();
    }
    return new Column(
        children: <Widget> [
        Container(

            child:AspectRatio( aspectRatio: controller.value.aspectRatio, child: new CameraPreview(controller))),
        Container(
          child:
              Column(
    children: <Widget> [
      Container(
        child: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialized.
              await _initializeControllerFuture;

              // Construct the path where the image should be saved using the path
              // package.
              final path = join(
                // Store the picture in the temp directory.
                // Find the temp directory using the `path_provider` plugin.
                (await getTemporaryDirectory()).path,
                '${DateTime.now()}.png',
              );

              // Attempt to take a picture and log where it's been saved.
              await controller.takePicture(path);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(imagePath: path),
                ),
              );
            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
        ),

      ),
    Container(
      child: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        // Provide an onPressed callback.
        onPressed: () {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
    builder: (context) => lpage(cameras)),
    (Route<dynamic> route) => false);

    }
  ),

      ),


    ]
    )

    ),]
    );
       Container(
         height: 60,
         child:AspectRatio( aspectRatio: controller.value.aspectRatio, child: new CameraPreview(controller)));
        Container(
      child: new Text('Government Guidelines'),
    );


  }

}
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}