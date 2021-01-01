import 'package:RadELT/models/destination_model.dart';
import 'package:RadELT/screens/category/components/activity-list.dart';
import 'package:RadELT/screens/category/sub_category.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> with SingleTickerProviderStateMixin{
  Destination destination = destinations[0];
  Widget listView(){
    return ActivityList(destination: destination);
  }
  Widget gridView(){
    return ActivityList(destination: destination,isPayed : true);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(  // Added
        length: 2,  // Added
        initialIndex: 0, //Added
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
                return [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    title: Text('دوره ها'),
                    bottom: TabBar(
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(icon: Text('همه دوره ها'),),
                        Tab(icon: Text('دوره های شما')),
                      ],
                    ),
                )
                ];
              },
              body: TabBarView(
                children: [
                  listView(),
                  gridView()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildCategoryCard extends StatelessWidget {
  const _BuildCategoryCard({
    Key key,
    @required this.destination,
  }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> SubCategory(destination:destination)));
      },      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0,5),
                      color: Colors.black12,
                      blurRadius: 6
                  )
                ]
            ),
            // width:MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(destination.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                )
            ),
            child: Text(destination.city,style: TextStyle(color:Colors.white70,fontSize: 18,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
