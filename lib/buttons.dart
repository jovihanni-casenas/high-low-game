import 'package:flutter/material.dart';

// class that creates a button for the game which can be used for landscape and portrait view
class Buttons extends StatelessWidget{
  
  // text stores whether a button should be labelled as HIGH or LOW
  // sizeFont determines the font size of the text
  // height and width corresponds to the buttons dimensions
  // onPress allows the button's function to be written in the
  // landscape_view.dart and portrait_view.dart files
  final text;
  final sizeFont;
  final height;
  final width;
  final onPress;

  const Buttons({Key? key, required this.text, required this.sizeFont, required this.height, required this.width, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
          height: height,
          width: width,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: SizedBox.expand(
            child: ElevatedButton(
              onPressed: onPress, 
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'OpenSansLight',
                  fontSize: sizeFont,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                overlayColor: MaterialStateProperty.all(const Color(0xFFB7B7F2)),
              ),
            ),
          ),
        );
  }
}