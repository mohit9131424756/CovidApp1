import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindemo1/main.dart';
import 'pag1.dart';
import 'launchingpage.dart';
import 'dart:io';

class maskScreen extends StatefulWidget {
  List<CameraDescription> cameras;
  maskScreen(this.cameras);

  @override
  State<StatefulWidget> createState() => _CameraScreenState();
}



class _CameraScreenState extends State<maskScreen> {


  CameraController controller;
  @override
  void initState()

  {
    super.initState();
    controller=new CameraController(widget.cameras[1], ResolutionPreset.high);
    controller.initialize().then((_)
    {
      if(!mounted){
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
    return new AspectRatio(aspectRatio: controller.value.aspectRatio,
      child: new CameraPreview(controller),);
  }

}
