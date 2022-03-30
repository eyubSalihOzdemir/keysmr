import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keysmr/midContainer.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

class botContainer extends StatelessWidget {
  const botContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          16.0, 0.0, 16.0, 16.0), //16.0, 16.0, 16.0, 16.0
      child: Container(
        //color: Colors.amber,
        // bottom container
        width: size.width,
        height: size.height * 0.11,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            botButtons(id: 0, text: "Sleep   Timer"),
            botButtons(id: 1, text: "Play"),
            //botButtons(text: "test")
          ],
        ),
      ),
    );
  }
}

class botButtons extends StatefulWidget {
  botButtons({Key key, @required this.id, @required this.text})
      : super(key: key);
  int id;
  String text;
  @override
  _botButtonsState createState() => _botButtonsState();
}

final keyboardSoftKey = [];
final keyboardSoftSpace = [];
final keyboardSoftEnter = [];

final keyboardRegularKey = [];
final keyboardRegularSpace = [];
final keyboardRegularEnter = [];

final keyboardLooseKey = [];
final keyboardLooseSpace = [];
final keyboardLooseEnter = [];

final keyboardOldKey = [];
final keyboardOldSpace = [];
final keyboardOldEnter = [];

void fillQueue() {
  keyboardSoftKey.clear();
  keyboardSoftSpace.clear();
  keyboardSoftEnter.clear();

  keyboardRegularKey.clear();
  keyboardRegularSpace.clear();
  keyboardRegularEnter.clear();

  keyboardLooseKey.clear();
  keyboardLooseSpace.clear();
  keyboardLooseEnter.clear();

  keyboardOldKey.clear();
  keyboardOldSpace.clear();
  keyboardOldEnter.clear();

  int softEnterCount = 7,
      softSpaceCount = 30,
      softKeyCount = 21,
      regularEnterCount = 11,
      regularSpaceCount = 19,
      regularKeyCount = 38,
      looseEnterCount = 12,
      looseSpaceCount = 17,
      looseKeyCount = 40,
      oldEnterCount = 12,
      oldSpaceCount = 17,
      oldKeyCount = 42;
  int i = 0;
  String path;
  //-------------------------------------------------------------------
  for (var i = 0; i < softEnterCount; i++) {
    path = "audios/softKeyboard/enter/${i}softKeyboardEnter.ogg";
    keyboardSoftEnter.add(path);
  }
  for (var i = 0; i < softSpaceCount; i++) {
    path = "audios/softKeyboard/space/${i}softKeyboardSpace.ogg";
    keyboardSoftSpace.add(path);
  }
  for (var i = 0; i < softKeyCount; i++) {
    path = "audios/softKeyboard/key/${i}softKeyboardKey.ogg";
    keyboardSoftKey.add(path);
  }
  //-------------------------------------------------------------------
  for (i = 0; i < regularEnterCount; i++) {
    path = "audios/regularKeyboard/enter/${i}regularKeyboardEnter.ogg";
    keyboardRegularEnter.add(path);
  }
  for (var i = 0; i < regularSpaceCount; i++) {
    path = "audios/regularKeyboard/space/${i}regularKeyboardSpace.ogg";
    keyboardRegularSpace.add(path);
  }
  for (var i = 0; i < regularKeyCount; i++) {
    path = "audios/regularKeyboard/key/${i}regularKeyboardKey.ogg";
    keyboardRegularKey.add(path);
  }
  //-------------------------------------------------------------------
  for (i = 0; i < looseEnterCount; i++) {
    path = "audios/looseKeyboard/enter/${i}looseKeyboardEnter.ogg";
    keyboardLooseEnter.add(path);
  }
  for (var i = 0; i < looseSpaceCount; i++) {
    path = "audios/looseKeyboard/space/${i}looseKeyboardSpace.ogg";
    keyboardLooseSpace.add(path);
  }
  for (var i = 0; i < looseKeyCount; i++) {
    path = "audios/looseKeyboard/key/${i}looseKeyboardKey.ogg";
    keyboardLooseKey.add(path);
  }
  //-------------------------------------------------------------------
  for (i = 0; i < oldEnterCount; i++) {
    path = "audios/oldKeyboard/enter/${i}oldKeyboardEnter.ogg";
    keyboardOldEnter.add(path);
  }
  for (var i = 0; i < oldSpaceCount; i++) {
    path = "audios/oldKeyboard/space/${i}oldKeyboardSpace.ogg";
    keyboardOldSpace.add(path);
  }
  for (var i = 0; i < oldKeyCount; i++) {
    path = "audios/oldKeyboard/key/${i}oldKeyboardKey.ogg";
    keyboardOldKey.add(path);
  }
}

bool keepPlaying = false;
bool playing = false;

bool check() {
  String keyboard = Variables.chosenValueKeyboard;
  bool isKeyboardChosen;
  switch (keyboard) {
    case 'Soft':
      isKeyboardChosen = true;
      break;
    case 'Regular':
      isKeyboardChosen = true;
      break;
    case 'Loose':
      isKeyboardChosen = true;
      break;
    case 'Old':
      isKeyboardChosen = true;
      break;
    default:
      isKeyboardChosen = false;
      break;
  }
  return isKeyboardChosen;
}

class _botButtonsState extends State<botButtons> {
  @override
  void initState() {
    super.initState();
    fillQueue();
  }

  final player = AudioPlayer();
  final player2 = AudioPlayer();

  playKeySounds() async {
    var queueKey = [];
    var queueEnter = [];
    var queueSpace = [];

    int random;
    int keyInterval;
    int i = 0, j = 0;
    while (keepPlaying) {
      final sentenceSkip = Random().nextInt(5) + 7; // between 7-12
      for (i = 0; i < sentenceSkip; i += 1) {
        // sentence skip
        final wordSkip = Random().nextInt(7) + 2; // between 2-9
        for (j = 0; j < wordSkip; j += 1) {
          // word skip

          player.setVolume(Variables.volumeSlider / 100.0);
          player2.setVolume(Variables.volumeSlider / 100.0);
          var keyboard = Variables.chosenValueKeyboard;
          switch (keyboard) {
            case 'Soft':
              queueKey = keyboardSoftKey;
              queueEnter = keyboardSoftEnter;
              queueSpace = keyboardSoftSpace;
              playing = true;
              break;
            case 'Regular':
              queueKey = keyboardRegularKey;
              queueEnter = keyboardRegularEnter;
              queueSpace = keyboardRegularSpace;
              playing = true;
              break;
            case 'Loose':
              queueKey = keyboardLooseKey;
              queueEnter = keyboardLooseEnter;
              queueSpace = keyboardLooseSpace;
              playing = true;
              break;
            case 'Old':
              queueKey = keyboardOldKey;
              queueEnter = keyboardOldEnter;
              queueSpace = keyboardOldSpace;
              playing = true;
              break;
            default:
              playing = false;
              break;
          }

          if (!keepPlaying) {
            return;
          }
          if (!playing) {
            return;
          }
          random = Random().nextInt(queueKey.length);
          keyInterval = Random().nextInt(Variables.randomnessSlider.toInt()) +
              (170 - Variables.speedSlider.toInt());
          await player.setAsset(queueKey[random]);
          await player.play();
          await Future.delayed(Duration(milliseconds: keyInterval));
          if (!keepPlaying) {
            return;
          }

          random = Random().nextInt(queueKey.length);
          keyInterval = Random().nextInt(Variables.randomnessSlider.toInt()) +
              (170 - Variables.speedSlider.toInt());
          await player2.setAsset(queueKey[random]);
          await player2.play();
          await Future.delayed(Duration(milliseconds: keyInterval));
          if (!keepPlaying) {
            return;
          }
        }

        random = Random().nextInt(queueSpace.length);
        keyInterval = Random().nextInt(Variables.randomnessSlider.toInt()) +
            (170 - Variables.speedSlider.toInt());
        await player.setAsset(queueSpace[random]);
        await player.play();
        await Future.delayed(Duration(milliseconds: keyInterval));
        if (!keepPlaying) {
          return;
        }
        // wait between words
        if (wordSkip <= 6) {
          await Future.delayed(Duration(milliseconds: keyInterval));
        } else {}
        await Future.delayed(Duration(milliseconds: keyInterval + 50));
      }

      // press enter
      if (!keepPlaying) {
        return;
      }
      //await Future.delayed(Duration(milliseconds: keyInterval)); // ????????
      random = Random().nextInt(queueEnter.length);
      keyInterval = Random().nextInt(Variables.randomnessSlider.toInt()) +
          (170 - Variables.speedSlider.toInt());
      await player2.setAsset(queueEnter[random]);
      await player2.play();
      await Future.delayed(Duration(milliseconds: keyInterval + 50));
      if (!keepPlaying) {
        return;
      }
    }
  }

  Timer timer;

  exitAfterMinutes(int minutes, int testCode) async {
    try {
      timer.cancel();
    } finally {
      timer = Timer(Duration(minutes: minutes), () {
        exit(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        width: size.width * 0.33, // 150
        height: size.height * 0.10,
        child: FloatingActionButton(
          splashColor: Color(0xFFAC3939).withAlpha(180),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(7.0, 7.0)),
              side: BorderSide(color: Color(0xFF490404), width: 2)),
          backgroundColor: Color(0xFF630B0B), //0xFF912626
          onPressed: () {
            if (widget.id == 1) {
              if (!keepPlaying) {
                if (check()) {
                  keepPlaying = true;
                  playKeySounds();
                  setState(() {
                    widget.text = "Stop";
                  });
                }
              } else {
                keepPlaying = false;
                player.stop();
                player2.stop();
                setState(() {
                  widget.text = "Play";
                });
              }
            } else if (widget.id == 0) {
              // sleep timer clicked
              if (keepPlaying || effectPlayer.playing) {
                setState(() {
                  if (widget.text == "Sleep   Timer") {
                    widget.text = "5   Minutes";
                    exitAfterMinutes(5, 5);
                  } else if (widget.text == "5   Minutes") {
                    widget.text = "10   Minutes";
                    exitAfterMinutes(10, 10);
                  } else if (widget.text == "10   Minutes") {
                    widget.text = "15   Minutes";
                    exitAfterMinutes(15, 15);
                  } else if (widget.text == "15   Minutes") {
                    widget.text = "Sleep   Timer";
                  }
                });
              } else {
                print("Play something before setting a timer");
                Fluttertoast.cancel();
                Fluttertoast.showToast(
                    msg: "Play something before setting a timer",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    fontSize: size.height * 0.019);
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              widget.text,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.height * 0.041, // 40
                  color: Color(0xFFAC3939),
                  fontWeight: FontWeight.w600,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 1.0),
                      blurRadius: 6.0,
                      color: Color.fromARGB(200, 0, 0, 0),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
