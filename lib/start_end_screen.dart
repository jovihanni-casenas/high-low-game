import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'help_screen.dart';
import 'buttons.dart';

// class that contains both start screen and game over screen
// constructor takes HIGH\nLOW and PLAY for start screen
// constructor takes GAME\nOVER and PLAY AGAIN for game over screen
class StartEndScreen extends StatelessWidget{

  // these two variables contain the two important values that decides whether start screen
  // game over screen will be viewed
  final String text;
  final String button;

  const StartEndScreen(this.text, this.button, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // taking dimensions of the screen to determine if it is in landscape or portrait
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        // creating gradient background
        decoration: const BoxDecoration(
            gradient: SweepGradient(
          colors: [
            Color(0xFFB7B7F2),
            Color(0xFFF8A2B2),
            Color(0xFFDEB2D5),
            Color(0xFFB7B7F2),
          ],
        )),
        // this column contains the main text and two buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // main text
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30*( (width>height) ? (width/height) : (height/width) ),
                fontFamily: 'TanPearl',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // PLAY or PLAY AGAIN button
            Buttons(
              text: button, 
              sizeFont: 10*( (width>height) ? (width/height) : (height/width) ),
              height: (width<height ? height/20 : height/15), 
              width: (width<height ? width/2 : width/4),
              onPress: (){
                // if PLAY or PLAY AGAIN button is pressed, player will be redirected to home screen
                // HomeScreen is a class from home_screen.dart file
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
              },
            ),
            const SizedBox(height: 10),
            // HELP button redirects to page which contains rules of the game
            Buttons(
              text: 'HELP', 
              sizeFont: 10*( (width>height) ? (width/height) : (height/width) ),
              height: (width<height ? height/20 : height/15), 
              width: (width<height ? width/2 : width/4),
              onPress: (){
                // if HELP button is pressed, player will be redirected to the help screen
                // HelpScreen is a class from help_screen.dart file
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen(),));
              },
            ),
            // EXIT button
            const SizedBox(height: 10),
            Buttons(
              text: 'EXIT', 
              sizeFont: 10*( (width>height) ? (width/height) : (height/width) ),
              height: (width<height ? height/20 : height/15), 
              width: (width<height ? width/2 : width/4),
              onPress: (){
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
