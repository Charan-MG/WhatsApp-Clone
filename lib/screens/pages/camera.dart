import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
    File _selectedFile;
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/images/placeholder.jpg",
        width: 350,
        height: 350,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
      this.setState((){
        _inProcess = true;
      });
      File image = await ImagePicker.pickImage(source: source);
      if(image != null){
        File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Color(0xff075E54),
          toolbarWidgetColor: Colors.white,
          statusBarColor: Color(0xff075E54),
          backgroundColor: Colors.white,
          activeControlsWidgetColor: Color(0xff25D366),
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      )
    );

        this.setState((){
          _selectedFile = cropped;
          _inProcess = false;
        });
      } else {
        this.setState((){
          _inProcess = false;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getImageWidget(),
              Container(
                padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                    MaterialButton(
                        color: Color(0xff075E54),
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        }),
                    MaterialButton(
                        color: Color(0xff075E54),
                        child: Text(
                          "Gallery",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        })
                  ],
                ),
              )
            ],
          ),
          (_inProcess)?Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.95,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ):Center()
        ],
      )
    );
  }
}