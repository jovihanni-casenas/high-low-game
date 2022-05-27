import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget{
  const HelpScreen({Key? key}) : super(key: key);


  @override 
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: SweepGradient(
          colors: [
            Color(0xFFB7B7F2),
            Color(0xFFF8A2B2),
            Color(0xFFDEB2D5),
            Color(0xFFB7B7F2),
          ],
        )),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              bottom: 20,
              right: 20,
              left: 20,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  'Press HIGH if you guess that the next card is greater than or equal to the current card.\nPress LOW if you guess that the next card is less than the current card.\n\nAce = 1\nJack = 11\nQueen = 12\nKing = 13\n\nGuessing right earns you a point, otherwise, it is GAME OVER for you. Enjoy!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'OpenSansLight',
                    fontSize: 8*( (width>height) ? (width/height) : (height/width) ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15*( (width>height) ? (width/height) : (height/width) ),
              left: 15*( (width>height) ? (width/height) : (height/width) ),
              child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_sharp),
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}