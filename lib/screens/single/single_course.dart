import 'package:RadELT/constants.dart';
import 'package:RadELT/screens/single/components/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SingleCourse extends StatefulWidget {
  @override
  _SingleCourseState createState() => _SingleCourseState();
}

class _SingleCourseState extends State<SingleCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('courseName')),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              ChewieListItem(
                videoPlayerController: VideoPlayerController.network(
                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DescriptionCard(),
                    SizedBox(height: 10,),
                    _LessonsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _LessonsCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:8,horizontal:20 ),
        child: Column(
          children: [
            _Title('جلسات دوره'),
            _lessonItem('نام دوره آموزشی','1', 1,1),
            _lessonItem('نام دوره آموزشی','2',0,0),
            _lessonItem('نام دوره آموزشی','3',1,0)
          ],
        ),
      )
    );
  }

  Padding _lessonItem(title,number,permission,playing) {
    return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                 children: [
                   Container(
                     alignment: Alignment.center,
                     width:25,
                     height:25,
                     decoration: BoxDecoration(
                       color:Colors.white,
                       shape: BoxShape.circle,
                       border: Border.all(
                         width: 2,
                         color: permission == 1 ? Colors.green : Colors.blueGrey.withOpacity(0.5)
                       ),
                     ),
                     child: permission == 1
                          ? playing==0
                              ? Icon(Icons.check,color: Colors.green,size: 17,)
                              : Icon(Icons.play_circle_filled,color: Colors.green,size: 15,)
                          : Icon(Icons.lock_outline,color: Colors.grey,size: 15,)
                   ),
                   SizedBox(width: 10,),
                   Text(
                     'فصل ${number} :',
                     style: TextStyle(fontSize: 12),
                   ),
                   SizedBox(width: 10,),
                   Text(
                     title,
                     style: TextStyle(fontSize: 12),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ],
                ),
                Divider()
              ],
            ),
          );
  }

  Card _DescriptionCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:8,horizontal:20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title('توضیحات دوره'),
            Padding(
              padding: EdgeInsets.all(8),
              child:  Text(
                'لورم ایپسوم یا طرح‌نما (به انگلیسی: Lorem ipsum) به متنی آزمایشی و بی‌معنی در صنعت چاپ، صفحه‌آرایی و طراحی گرافیک گفته می‌شود. طراح گرافیک از این متن به عنوان عنصری از ترکیب بندی برای پر کردن صفحه و ارایه اولیه شکل ظاهری و کلی طرح سفارش گرفته شده استفاده می نماید، تا از نظر گرافیکی نشانگر چگونگی نوع و اندازه فونت و ظاهر متن باشد. معمولا طراحان گرافیک برای صفحه‌آرایی، نخست از متن‌های آزمایشی و بی‌معنی استفاده می‌کنند تا صرفا به مشتری یا صاحب کار خود نشان دهند که صفحه طراحی یا صفحه بندی شده بعد از اینکه متن در آن قرار گیرد چگونه به نظر می‌رسد و قلم‌ها و اندازه‌بندی‌ها چگونه در نظر گرفته شده‌است. از آنجایی که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می‌باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه‌آرایی می‌کنند تا مرحله طراحی و صفحه‌بندی را به پایان برند.',
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      )
    );
  }

  Column _Title(text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TextStyle(fontWeight: FontWeight.bold)),
        Divider(color: kThirdColor,),
      ],
    );
  }
}