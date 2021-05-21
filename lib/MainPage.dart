import 'package:flutter/material.dart';
import 'package:learngreen_v1/CoursePage.dart';
import 'package:learngreen_v1/LessonPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      routes: {
        '/coursePage' : (context)=>coursePage(),
        '/lessonPage' : (context)=>lessonPage(),
      },
    );
  }
}
class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Hello Students", style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/image/profilePic.png')
                    )
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Text('What do you \nwant to \nlearn today?', style: TextStyle(
              fontSize: 35,
              height: 1.1,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          courseWidget('Environmental Science', 'Climate Change', 'img1', Color(0xff1bb84e), Color(0xff9feba0)),
                          SizedBox(height: 20,),
                          courseWidget('Category2', 'Course2', 'img2', Color(0xffe9eefa), Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(height: 50,),
                          courseWidget('Category3', 'Course3', 'img3', Color(0xffe9eefa), Colors.white),
                          SizedBox(height: 20,),
                          courseWidget('Category4', 'Course4', 'img4', Color (0xffbdcddfa), Color(0xffcedaf1)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                   icon: Icon(
                     Icons.subscriptions,
                     color: Color(0xff2657ce),
                     size: 40,
                   ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: Color(0xff2657ce).withOpacity(0.5),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: Color(0xff2657e).withOpacity(0.5),
                      size: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Container courseWidget(String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
        onTap: (){openCoursePage('$img','$title');},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),

              ),
              child: Text('$category', style: TextStyle(
                color: (categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) : Colors.white)
              ),),
            ),
            SizedBox(height: 10,),
            Text('$title', style: TextStyle(
              color: (bgColor == Color(0xffff5954)) ? Colors.white : Colors.black,
              fontSize: 20,
              height: 1,
            ),),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Container(
                    height: 5,
                    width: 100,
                    color: (bgColor == Color(0xffff5954)) ? Colors.red : Color(0xff2657ce),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: (bgColor == Color(0xffff5954)) ? Colors.white.withOpacity(0.5) : Color(0xff2657ce).withOpacity(0.5),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Hero(
                tag: '$img',
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/$img.png'),
                    )
                  )
                ),
            )
          ],
        ),
      )
    );
  }
  void openCoursePage(String img, String title)
  {
    Navigator.pushNamed(context, '/coursePage', arguments: {'img':'$img', 'title':'$title'});
  }
}


