import 'package:flutter/material.dart';
import 'landscape_view.dart';
import 'portrait_view.dart';
import 'generate_random_card.dart';

// class that contains home screen which toggles between landscape and portrait
// view depending on values from media query
class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {

  // streak counts the number of right guesses in a game
  // randomCard stores the string of the random card face's path - randomCard[0]
  // and int value of the random card - randomCard[1]
  // guessedCards contains list of strings of card's path which were correctly guessed
  int streak=0;
  List randomCard=GenerateRandomCard.getRandomCard();
  List<String> guessedCards=['', '', '', ''];

  @override
  Widget build(BuildContext context){

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
          )
        ),
        // if width is greater than height, app is viewed in landscape, otherwise, portrait
        child: width>height
          ? LandscapeView(
              height,
              width,
              streak,
              randomCard,
              guessedCards
            )
          : PortraitView(
              height,
              width,
              streak,
              randomCard,
              guessedCards
            ),
      ),
    );
  }
}