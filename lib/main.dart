import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Destiny());
}

class Destiny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/night-sky.png'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DestinyPage(),
          ),
        ),
      ),
    );
  }
}

class DestinyPage extends StatefulWidget {
  @override
  _DestinyPageState createState() => _DestinyPageState();
}

class _DestinyPageState extends State<DestinyPage> {
  StoryBrain storyBrain = StoryBrain();
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                storyBrain.fetchLegend(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                setUserChoice(1);
              },
              child: Text(
                storyBrain.fetchChoice(1),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Opacity(
              opacity: _opacity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  setUserChoice(2);
                },
                child: Text(
                  storyBrain.fetchChoice(2),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setUserChoice(int userChoice) {
    setState(() {
      storyBrain.nextStory(userChoice);
      storyBrain.fetchChoice(2).isEmpty ? _opacity = 0.0 : _opacity = 1.0;
    });
  }
}
