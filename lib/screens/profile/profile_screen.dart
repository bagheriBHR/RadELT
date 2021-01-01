import 'package:RadELT/constants.dart';
import 'package:RadELT/screens/profile/components/image_picker.dart';
import 'package:RadELT/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body:Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileHeader(_size),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InfoItem('5','دوره های خریداری شده'),
                          InfoItem('16000','موجودی کیف پول'),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: kThirdColor,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         ActionCard(_size,Icons.monetization_on,Colors.green,'شارژ کیف پول'),
                         ActionCard(_size,Icons.photo,Colors.red,'تصویر پروفایل'),
                       ],
                      ),
                      SizedBox(height: 10,),
                      EditButton()
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  Container ProfileHeader(Size _size) {
    return Container(
      width: _size.width*0.8,
      height:_size.height*0.4,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [kPrimaryColor.withOpacity(0.4), kThirdColor.withOpacity(0.4)]),
          borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
            offset: Offset(0,0),
            blurRadius: 6,
            color: Colors.white10
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImagePicker(),
          SizedBox(height: 10,),
          Text('نام و نام خانوادگی',style: TextStyle(color: Colors.black87,fontSize:16,fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text('+9139948576',style: TextStyle(color: Colors.black87,fontSize: 16),)
        ],
      ),
    );
  }

  Container EditButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new EditProfileScreen())
          );        },
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit,color: Colors.deepPurple,size: 20,),
            SizedBox(width: 10,),
            Text('ویرایش پروفایل',style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

  Container ActionCard(size,icon,color,desc) {
    return Container(
     width: size.width/3,
     height:size.width/4,
     decoration: BoxDecoration(
       color: Colors.white,
       boxShadow: [
         BoxShadow(
           offset: Offset(0,2),
           color: Colors.black12,
           blurRadius:10
         ),
       ],
       borderRadius: BorderRadius.circular(2),
     ),
     child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Icon(icon,color: color,size: 25,),
         SizedBox(height: 10,),
         Text(desc,style: TextStyle(fontWeight: FontWeight.bold),)
       ],
     )
   );
  }

  Column InfoItem(number,desc) {
    return Column(
        children:[
          Text(number,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kThirdColor),),
          SizedBox(height: 10,),
          Text(desc)
        ]
    );
  }
}

