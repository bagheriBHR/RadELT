import 'dart:io';

import 'package:custom_navigator/custom_navigation.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:RadELT/constants.dart';
import 'package:RadELT/screens/cache/cache_screen.dart';
import 'package:RadELT/screens/home/home_page.dart';
import 'package:RadELT/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Navs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => NavsState();
}

class NavsState extends State<Navs> with SingleTickerProviderStateMixin{

  TabController _tabController;
  Widget _page;
  int _currentIndex = 0;
  Map<String,Widget> _bottomNavigationBar;
  String _cutrrentView = 'mainBar';

  final List<IconData> _icons = const [
    Icons.home,
    FontAwesomeIcons.moneyBillWave,
    Icons.person,
    Icons.search,
    Icons.menu
  ];

  final _pages = [
    HomePage(),
    CacheScreen(),
    ProfileScreen(),
  ];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _page = _pages[0];

    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if(_tabController.index==4){
        _tabController.index =_tabController.previousIndex;
        _drawerKey.currentState.openDrawer();
      }
      if(_tabController.index==3){
        _tabController.index =_tabController.previousIndex;
        setState(()=>_cutrrentView = 'searchBar');
      }
    });

    DefaultTabController mainBar = DefaultTabController(
        length: _icons.length,
        child: Container(
          color:Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              // border: Border(
              //   top: BorderSide(
              //     color: kPrimaryColor,
              //     width: 3
              //   ),
              // ),
            ),
            tabs: _icons.asMap().entries.map((MapEntry e) => Tab(
              icon:Icon(e.value),
            )).toList(),
            onTap: (index) {
                navigatorKey.currentState.maybePop();
                setState(() {
                  _page = _pages[index];
                  _currentIndex = index;
                });
              }
          ),
        ),
      );

    Widget searchBar = Container(
      padding: EdgeInsets.only(right: 10),
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.arrow_back,color: Color(0xff075e54),),
            onTap: (){
              setState(() {
                _cutrrentView = 'mainBar';
              });
            },
          ),
          SizedBox(width:10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'جستجو...'
              ),
            ),
          ),
        ],
      ),
    );
    _bottomNavigationBar = {
      "mainBar" : mainBar,
      "searchBar" : searchBar,
    };
 }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _drawerKey,
        drawer: buildDrawer(),
        body: Stack(
          children: [
            CustomNavigator(
              navigatorKey: navigatorKey,
              home: _page,
              pageRoute: PageRoutes.materialPageRoute,
            ),
            Positioned(
              bottom:0,
              right:0,
              left:0,
              child: _bottomNavigationBar[_cutrrentView],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Align(child: Text('خروج از برنامه'),alignment: Alignment.centerRight,),
            content:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('آیا از خروج خود مطمئن هستید؟'),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('خیر',style: TextStyle(color: Colors.red,fontSize: 18),),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text('بله',style: TextStyle(color: Colors.green,fontSize: 18)),
              )
            ],
          );
        }
    );
  }

  Widget buildDrawer() {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        child: Container(
          color:kPrimaryColor.withOpacity(0.8),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 160,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                            child: Image.asset('assets/images/Logo Square.png',fit: BoxFit.cover,)
                        ),
                        SizedBox(height:10,),
                        Text(
                          'www.RadElt.ir',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DrawerItem(icon: FontAwesomeIcons.chalkboardTeacher,title:'دوره ها',ontap: (){},),
              DrawerItem(icon: FontAwesomeIcons.newspaper,title:'مقالات',ontap: (){},),
              DrawerItem(icon: FontAwesomeIcons.microphone,title:'پادکست ها',ontap: (){},),
              DrawerItem(icon: FontAwesomeIcons.solidFileVideo,title:'ویدیوکست ها',ontap: (){},),
              DrawerItem(icon: FontAwesomeIcons.bookOpen,title:'کتاب و منابع',ontap: (){},),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.ontap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon,size: 20,color: Colors.white,),
            title: Text(title,style: TextStyle(fontSize: 16,fontFamily: 'Vazir',color: Colors.white),),
          ),
          Divider(
            thickness: 2,
            color: Colors.white.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}
