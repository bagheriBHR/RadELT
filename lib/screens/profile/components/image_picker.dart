import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<CustomImagePicker> {

  File imageFile;

  _openGallery() async{
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    // Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }

  _openCamera() async{
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(pickedFile.path);
    });
    Navigator.pop(context);
  }

  Future<void> _showDialogBox(BuildContext context){
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 150,
            color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.photo,color: Colors.grey,size: 18,),
                      SizedBox(width:8),
                      Text('دریافت از گالری',style: TextStyle(fontSize: 18),),
                    ],
                  ),
                    onTap: (){
                      _openGallery();
                    },
                  ),
                  Divider(),
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt,color: Colors.grey,size: 18,),
                        SizedBox(width:8),
                        Text('دوربین',style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    onTap: (){
                      _openCamera();
                    },
                  )
                ],
              ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,2),
                    color:Colors.grey,
                    blurRadius: 6
                )
              ],
              shape: BoxShape.circle,
              color: Colors.grey,
              border: Border.all(
                  color: Colors.white,
                  width: 2
              ),
              image: imageFile !=null
                  ? new DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(imageFile)
                  )
                  :null
          ),
        ),
        Positioned(
          right:10,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.add,color: Colors.grey,size: 14,),
              onPressed: (){_showDialogBox(context);},
            ),
          ),
        )
      ],
    );
  }
}