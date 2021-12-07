import 'dart:io';

import 'package:app/components/homeScreen.dart';
import 'package:app/components/screens/loadScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class initialScreen extends StatefulWidget {
  @override
  _initialScreenState createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {
  bool flag = true;
  // Access image (remark:need to pull out)

  File image;
  // click image
  imageFrontCamera() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        image = File(img.path);
      });
    }
  }

  // upload image
  imageFromGallery() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        image = File(img.path);
      });
    }
  }

  void pickOption(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext b) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Capture Image"),
                onTap: () {
                  imageFrontCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.file_upload),
                title: Text("Upload Image"),
                onTap: () {
                  imageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return flag
        ? Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      pickOption(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.deepPurple,
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          Text(
                            "Select Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // if image preview

                Container(
                  width: 300,
                  height: 300,
                  color: Colors.black26,
                  child: image != null
                      ? Image.file(image, fit: BoxFit.fill)
                      : Center(child: Text("Preview")),
                ),
                SizedBox(
                  height: 10,
                ),
                image != null
                    ? IconButton(
                        icon: Icon(Icons.double_arrow_rounded,
                            color: Colors.black38),
                        onPressed: () {
                          setState(() {
                            flag = !flag;
                          });
                        })
                    : Container(),
              ],
            ),
          )
        : loadScreen();
  }
}
