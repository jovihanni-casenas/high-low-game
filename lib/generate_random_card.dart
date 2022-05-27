import 'dart:math';

// class for generating a random card
class GenerateRandomCard{

  // randomIndex stores a random int ranging from 0 to total number of cards
  // cards is a 2D list containing the string of the card's path and its value
  static int randomIndex=0;
  static List cards=[
    ['assets/images/2C.png', 2],
    ['assets/images/2D.png', 2],
    ['assets/images/2H.png', 2],
    ['assets/images/2S.png', 2],
    ['assets/images/3C.png', 3],
    ['assets/images/3D.png', 3],
    ['assets/images/3H.png', 3],
    ['assets/images/3S.png', 3],
    ['assets/images/4C.png', 4],
    ['assets/images/4D.png', 4],
    ['assets/images/4H.png', 4],
    ['assets/images/4S.png', 4],
    ['assets/images/5C.png', 5],
    ['assets/images/5D.png', 5],
    ['assets/images/5H.png', 5],
    ['assets/images/5S.png', 5],
    ['assets/images/6C.png', 6],
    ['assets/images/6D.png', 6],
    ['assets/images/6H.png', 6],
    ['assets/images/6S.png', 6],
    ['assets/images/7C.png', 7],
    ['assets/images/7D.png', 7],
    ['assets/images/7H.png', 7],
    ['assets/images/7S.png', 7],
    ['assets/images/8C.png', 8],
    ['assets/images/8D.png', 8],
    ['assets/images/8H.png', 8],
    ['assets/images/8S.png', 8],
    ['assets/images/9C.png', 9],
    ['assets/images/9D.png', 9],
    ['assets/images/9H.png', 9],
    ['assets/images/9S.png', 9],
    ['assets/images/10C.png', 10],
    ['assets/images/10D.png', 10],
    ['assets/images/10H.png', 10],
    ['assets/images/10S.png', 10],
    ['assets/images/AC.png', 1],
    ['assets/images/AD.png', 1],
    ['assets/images/AH.png', 1],
    ['assets/images/AS.png', 1],
    ['assets/images/JC.png', 11],
    ['assets/images/JD.png', 11],
    ['assets/images/JH.png', 11],
    ['assets/images/JS.png', 11],
    ['assets/images/QC.png', 12],
    ['assets/images/QD.png', 12],
    ['assets/images/QH.png', 12],
    ['assets/images/QS.png', 12],
    ['assets/images/KC.png', 13],
    ['assets/images/KD.png', 13],
    ['assets/images/KH.png', 13],
    ['assets/images/KS.png', 13],
  ];

  // method that returns a list containing the string of the path of the random card - cards[randomIndex][0]
  // and the card's value - cards[randomIndex][1]
  static List getRandomCard(){
    randomIndex=Random().nextInt(13*4);
    return [cards[randomIndex][0], cards[randomIndex][1]];
  }
}