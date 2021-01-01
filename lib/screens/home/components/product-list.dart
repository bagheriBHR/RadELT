import 'package:RadELT/constants.dart';
import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/single/single-product.dart';
import 'package:RadELT/screens/single/single_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: destinations.length ,
          itemBuilder: (BuildContext context , int index){
            Destination destination  = destinations[index];
            return Container(
              width: 250,
              margin: EdgeInsets.all(5),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 240,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('دوره آموزش گرامر و مکالمه زبان انگلیسی',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 8,),
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
                                    Text('4:30'),
                                    SizedBox(width: 4,),
                                    Icon(Icons.timer,size:16,color:Colors.grey)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('20000 تومان',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 16),),
                                RaisedButton(
                                  color: Colors.black54,
                                  textColor: kThirdColor,
                                  onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleCourse()));},
                                  child: Text('عضویت'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(_)=> SingleProduct(destination:destination)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0,2),
                            color: Colors.black26
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          width: 220,
                          height: 124,
                          image: AssetImage(destination.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
      ),
    );
  }
}
