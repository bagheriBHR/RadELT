import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/single/single_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length ,
        itemBuilder: (BuildContext context , int index){
          Destination destination  = destinations[index];
          return Container(
            width: 210,
            margin: EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 200,
                    height: 100,
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
                          Text('دوره آموزش گرامر و مکالمه زبان انگلیسی',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: destination.imageUrl,
                  child: Material(
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(_)=> SingleArticle(destination:destination)));
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
                          child :ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: 190,
                              height: 107,
                              image: AssetImage(destination.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
