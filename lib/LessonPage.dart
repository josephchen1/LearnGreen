import 'package:flutter/material.dart';
import 'package:learngreen_v1/Flashcard.dart';
import 'package:learngreen_v1/FlashcardView.dart';
import 'package:flip_card/flip_card.dart';

class LessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("fuck this"),),
    );
    return Container();
  }
}

class lessonPage extends StatefulWidget {
  @override
  _lessonPageState createState() => _lessonPageState();
}

class _lessonPageState extends State<lessonPage> {
  String chosenTitle;
  String chosenInfo;
  String chosenLesson;
  int chosenLessonNum;
  Text lessonText;
  List<Text> _lessonContent = [
    Text("Climate change is a change in the pattern of weather,t and related changes in oceans, land surfaces and ice sheets, occurring over time scales of decades or longer. Human consumption of fossil fuels has resulted in the global average of temperatures rising at an unprecedented rate, resulting in many unparalleled effects.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),),
    Text("Climate change describes a change in the average conditions — such as temperature and rainfall — in a region over a long period of time. NASA scientists have observed Earth’s surface is warming, and many of the warmest years on record have happened in the past 20 years.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),),
    Text("The greenhouse effect is when gases in Earth's atmosphere trap the Sun's heat, thus making Earth warmer. This has made human life suitable to thrive on planet Earth. In the late 19th century, humans started to burn fossil fuels, such as coal, to provide the energy required to propel our cars, and keep the lights on in our homes. Unfortunately, this has led to many unintentional effects.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),),
    Text("The burning of fossil fuels such as coal and oil releases “greenhouse gases,” such as carbon dioxide and methane, into the atmosphere. The rapid increase of greenhouse gases in the atmosphere has caused Earth's atmosphere trap heat at a much quicker pace. Thus, Earth has warmed up at an unprecedented rate.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),),
    Text("Reducing our usage of fossil fuels—coal, oil, natural gas—will be one of the most pressing challenges that the United States and the rest of the world faces today. Nearly 50% of all American electricity is supplied by the burning of coal. Potential alternatives to fossil fuels include nuclear, solar, wind, and hydroelectric energy. While the above methods produce less emissions, they also have unique downsides.", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),)
  ];
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "Ghostbusters!"),
    Flashcard(
        question: "Who teaches you how to write sexy code?",
        answer: "Ya boi Kilo Loco!")
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute
        .of(context)
        .settings
        .arguments as Map;
    chosenTitle = arguments['title'];
    chosenInfo = arguments['info'];
    chosenLesson = arguments['lesson'];
    chosenLessonNum = int.parse('$chosenLesson');
    lessonText = _lessonContent[chosenLessonNum-1];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xffe1eaff),
          ),
          child: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2657ce),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$chosenTitle', style: TextStyle(
              color: Color(0xff2657ce),
              fontSize: 27,
            ),),
            Text('$chosenInfo', style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 20
            ),),
            SizedBox(
              height: 20
            ),
            SizedBox(
              height: 550,
              width: 350,
              child:
                  lessonText,
                // Text('$lessonText', style: TextStyle(
                //     color: Colors.black.withOpacity(0.6),
                //     fontSize: 20
                // ),),
            ),
            // SizedBox(
            //     width: 350,
            //     height: 550,
            //     child: FlipCard(
            //         front: FlashcardView(
            //           text: _flashcards[_currentIndex].question,
            //         ),
            //         back: FlashcardView(
            //           text: _flashcards[_currentIndex].answer,
            //         ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlineButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev')),
                OutlineButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
      (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
      (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}


