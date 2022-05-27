import 'package:flutter/material.dart';
import 'buttons.dart';
import 'generate_random_card.dart';
import 'start_end_screen.dart';

// class containing landscape view
class LandscapeView extends StatefulWidget{

  // streak counts the number of right guesses in a game
  // randomCard stores the string of the random card face's path - randomCard[0]
  // and int value of the random card - randomCard[1]
  // guessedCards contains list of strings of card's path which were correctly guessed
  double screenWidth, screenHeight;
  int streak;
  List randomCard;
  List<String> guessedCards;

  LandscapeView(this.screenHeight, this.screenWidth, this.streak, this.randomCard, this.guessedCards, {Key? key}) : super(key: key);

  @override
  State<LandscapeView> createState() => _LandscapeViewState();
}

class _LandscapeViewState extends State<LandscapeView> {

  // method for evaluating if user guess is correct
  void _evaluateChoice(var condition, var _newCard){
    if(condition){
      setState(() {
        widget.streak+=1;
        widget.guessedCards.insert(0, widget.randomCard[0]);
        widget.randomCard[0]=_newCard[0];
        widget.randomCard[1]=_newCard[1];
       });
    }
    else{
      setState(() {
        widget.streak=0;
        for(int i=0;i<4;i++){
          widget.guessedCards[i]='';
        }
        widget.randomCard=_newCard;
      });
      // redirecting to game over screen
      // StartEndScreen is a class under start_end_screen.dart file
       Navigator.push(context, MaterialPageRoute(builder: (context) => const  StartEndScreen('GAME\nOVER', 'PLAY AGAIN'),));
    }
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: widget.screenHeight,
      width: widget.screenWidth,
        // this Row contains all column that can be seen on screen
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(widget.screenWidth*0.025, widget.screenHeight*0.025, widget.screenWidth*0.025, widget.screenHeight*0.025),
              width: widget.screenWidth*0.25,
              // this column contains first column containers - logo, winning streak, buttons
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // HIGH LOW logo
                  SizedBox( 
                    height: widget.screenHeight*0.4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "HIGH\nLOW",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'TanPearl',
                          fontSize: 22*(widget.screenWidth/widget.screenHeight), 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // winning steak
                  SizedBox(
                    height: widget.screenHeight*0.1,
                    child: Container(
                      alignment:  Alignment.topCenter,
                      child: Text(
                        "Winning streak: ${widget.streak}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'OpenSansLight',
                          fontSize: 8*(widget.screenWidth/widget.screenHeight),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // HIGH and LOW buttons
                  SizedBox(
                    height: widget.screenHeight*0.4,
                    width: widget.screenWidth*0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // HIGH button
                        Buttons(
                          text: 'HIGH',
                          sizeFont: ((widget.screenWidth*0.25)/(widget.screenHeight*0.1))*5, 
                          height: widget.screenHeight*0.1, 
                          width: widget.screenWidth*0.2,
                          onPress: (){
                            // generate new card
                            // evaluate if value of current card>=new card
                            // if true streak increments, current card is inserted to guessed cards list, new card values are set as current
                            // if false, streak resets to 0 and guessed cards is emptied, then player is redirected to game over screen
                            List _newCard=GenerateRandomCard.getRandomCard();
                            _evaluateChoice(_newCard[1]>=widget.randomCard[1], _newCard);
                          },
                        ),
                        // LOW button
                        Buttons(
                          text: 'LOW',
                          sizeFont: ((widget.screenWidth*0.25)/(widget.screenHeight*0.1))*5, 
                          height: widget.screenHeight*0.1, 
                          width: widget.screenWidth*0.2,
                          onPress: (){
                            // generate new card
                            // evaluate if value of current card<new card
                            // if true streak increments, current card is inserted to guessed cards list, new card values are set as current
                            // if false, streak resets to 0 and guessed cards is emptied, then player is redirected to game over screen
                            List _newCard=GenerateRandomCard.getRandomCard();
                            _evaluateChoice(_newCard[1]<widget.randomCard[1], _newCard);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // this container has all containers of second column - back of card image
            Container(
              width: widget.screenWidth*0.25,
              padding: EdgeInsets.all(widget.screenWidth*0.025),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12*(widget.screenWidth/720)),
                child: const Image(
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/neon_card_back.png'),
                ),
              ),
            ),
            // this container has all containers of third column - current card image
            Container(
              width: widget.screenWidth*0.25,
              padding: EdgeInsets.all(widget.screenWidth*0.025),
              child: SizedBox(
                    width: widget.screenWidth*0.25,
                    child: Image(
                      alignment: Alignment.center,
                      image: AssetImage(widget.randomCard[0]),
                    ),
                  ),
            ),
            // this contains all widget in fourth column - 4 remaining cards from guessed cards list
            SizedBox(
              width: widget.screenWidth*0.25,
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    // first row of images containing two images
                    Row(
                      children: [
                        // second to the latest image
                        // if image is not available, an empty SizedBox is displayed
                        Container(
                          margin: const EdgeInsets.all(0.025),
                          width: widget.screenWidth*(0.2/2),
                          child: widget.guessedCards[0]=='' ? SizedBox(height: (widget.screenWidth*0.2*1056)/(2*691)) : Image.asset(widget.guessedCards[0]),
                        ),
                        // third to the latest image
                        // if image is not available, an empty SizedBox is displayed
                        Container(
                          margin: const EdgeInsets.all(0.025),
                          width: widget.screenWidth*(0.2/2),
                          child: widget.guessedCards[1]=='' ? SizedBox(height: (widget.screenWidth*0.2*1056)/(2*691)) : Image.asset(widget.guessedCards[1]),
                        ),
                      ],
                    ),
                    // second row of images containing two images
                    Row(
                      children: [
                        // fourth to the latest image
                        // if image is not available, an empty SizedBox is displayed
                        Container(
                          margin: const EdgeInsets.all(0.025),
                          width: widget.screenWidth*(0.2/2),
                          child: widget.guessedCards[2]=='' ? SizedBox(height: (widget.screenWidth*0.2*1056)/(2*691)) : Image.asset(widget.guessedCards[2]),
                        ),
                        // fifth to the latest image
                        // if image is not available, an empty SizedBox is displayed
                        Container(
                          margin: const EdgeInsets.all(0.025),
                          width: widget.screenWidth*(0.2/2),
                          child: widget.guessedCards[3]=='' ? SizedBox(height: (widget.screenWidth*0.2*1056)/(2*691)) : Image.asset(widget.guessedCards[3]),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}