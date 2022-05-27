import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'start_end_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // play music throughout the use of the app
  AssetsAudioPlayer.newPlayer().open(
    Audio('assets/audios/background_music.mp3'),
    autoStart: true,
  );
  runApp(const HighLow());
}

// class that contains the MaterialApp
class HighLow extends StatelessWidget{
  const HighLow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      // StartEndScreen is a constructor that outputs either the start screen or game over screen 
      // depending on the values passed to the constructor
      // 'HIGH\nLOW', 'PLAY' values are for the start screen
      // StartEndScreen is a class from start_end_screen.dart file
      home: StartEndScreen('HIGH\nLOW', 'PLAY'),
    );
  }
}

