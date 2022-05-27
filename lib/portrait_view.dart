import 'package:flutter/material.dart';
import 'buttons.dart';
import 'generate_random_card.dart';
import 'start_end_screen.dart';

// class that contains portrait view
class PortraitView extends StatefulWidget{

  // streak counts the number of right guesses in a game
  // randomCard stores the string of the random card face's path - randomCard[0]
  // and int value of the random card - randomCard[1]
  // guessedCards contains list of strings of card's path which were correctly guessed
  double screenWidth, screenHeight;
  int streak;
  List randomCard;
  List<String> guessedCards;

  PortraitView(this.screenHeight, this.screenWidth, this.streak, this.randomCard, this.guessedCards, {Key? key}) : super(key: key);

  @override
  State<PortraitView> createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {

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
        // this Column contains all widgets displayed on screen for portrait view
        child: Column(
          children: [
            SizedBox(
              height: widget.screenHeight*0.3,
              width: widget.screenWidth,
              // Row that contains HIGH LOW logo, winning streak
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widget.screenWidth*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // HIGH LOW logo
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "HIGH\nLOW",
                            style: TextStyle(
                              fontFamily: 'TanPearl',
                              fontSize: (widget.screenWidth/widget.screenHeight)*58,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // winning streak
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Winning streak: ${widget.streak}",
                            style: TextStyle(
                              fontFamily: 'OpenSansLight',
                              fontSize: (widget.screenWidth/widget.screenHeight)*25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // contains HIGH and LOW buttons
                  Container(
                    width: widget.screenWidth*0.5,
                    height: widget.screenHeight*0.4,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // HIGH button
                        Buttons(
                          text: 'HIGH',
                          sizeFont: ((widget.screenHeight*0.25)/(widget.screenWidth*0.1))*5, 
                          height: widget.screenHeight/15, 
                          width: widget.screenWidth*0.4,
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
                          sizeFont: ((widget.screenHeight*0.25)/(widget.screenWidth*0.1))*5, 
                          height: widget.screenHeight/15, 
                          width: widget.screenWidth*0.4,
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
            // third row contains back of card and current card
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // back of card
                SizedBox(
                  width: widget.screenWidth/2,
                  height: widget.screenHeight*0.5,
                  child: Container(
                    width: widget.screenHeight*0.5*(691/1056),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(widget.screenHeight*0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(widget.screenHeight*0.02),
                      child: Image.asset('assets/images/neon_card_back.png'),
                    ),
                  ),
                ),
                // current card
                Container(
                  width: widget.screenWidth/2,
                  height: widget.screenHeight*0.5,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(widget.screenHeight*0.02),
                  child: SizedBox(
                        width: widget.screenWidth,
                        child: Image.asset(widget.randomCard[0]),
                      ),
                ),
              ],
            ),
            // fourth row contains remaining images in guessed cards list
            Container(
              width: widget.screenWidth,
              height: widget.screenHeight*0.2,
              padding: EdgeInsets.fromLTRB(0, 0, 0, widget.screenHeight*0.05),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // second to the latest image
                  // if image is not available, an empty SizedBox is displayed
                  Container(
                    padding: const EdgeInsets.all(0.025),
                    width: widget.screenWidth/4,
                    child: widget.guessedCards[0]=='' ? const SizedBox() : Image.asset(widget.guessedCards[0]),
                  ),
                  // third to the latest image
                  // if image is not available, an empty SizedBox is displayed
                  Container(
                    padding: const EdgeInsets.all(0.025),
                    width: widget.screenWidth/4,
                    child: widget.guessedCards[1]=='' ? const SizedBox() : Image.asset(widget.guessedCards[1]),
                  ),
                  // fourth to the latest image
                  // if image is not available, an empty SizedBox is displayed
                  Container(
                    padding: const EdgeInsets.all(0.025),
                    width: widget.screenWidth/4,
                    child: widget.guessedCards[2]=='' ? const SizedBox() : Image.asset(widget.guessedCards[2]),
                  ),
                  // fifth to the latest image
                  // if image is not available, an empty SizedBox is displayed
                  Container(
                    padding: const EdgeInsets.all(0.025),
                    width: widget.screenWidth/4,
                    child: widget.guessedCards[3]=='' ? const SizedBox() : Image.asset(widget.guessedCards[3]),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
    );
  }
}