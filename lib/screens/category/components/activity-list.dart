import 'package:RadELT/constants.dart';
import 'package:RadELT/models/activity_model.dart';
import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/single/single_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    Key key,
    @required this.destination,
    this.isPayed = false,
  }) : super(key: key);

  final Destination destination;
  final bool isPayed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
        itemCount: destination.activities.length,
        itemBuilder: (BuildContext context,int index){
          Activity activity = destination.activities[index];
          return Stack(
            alignment: Alignment.center,
              children:[
                Container(
                  padding:EdgeInsets.fromLTRB(15, 5, 120, 5),
                  margin: EdgeInsets.fromLTRB(10, 5, 30, 5),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('دوره آموزش گرامر و مکالمه زبان انگلیسی',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Row(
                            children: [
                              Text('4:30',style: TextStyle(fontSize: 12),),
                              SizedBox(width: 4,),
                              Icon(Icons.timer,size:14,color:Colors.grey)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('20000 تومان',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 14),),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleCourse()));},
                            child:Container(
                              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                              ),
                              child: Text(isPayed ? 'مشاهده دوره' : 'عضویت',style: TextStyle(color: kThirdColor,fontWeight: FontWeight.bold,fontSize: 12),),
                            )
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right:10,
                  // top:15,
                  // bottom:15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(activity.imageUrl),
                      width:130,
                      height: 75,
                      fit:BoxFit.cover,
                    ),
                  ),
                )
              ]
          );
        },
      ),
    );
  }
}