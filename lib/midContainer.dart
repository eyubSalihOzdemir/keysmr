import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_audio/just_audio.dart';
import 'package:keysmr/topContainer.dart';
import 'botContainer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_icons/flutter_icons.dart';

class midContainer extends StatefulWidget {
  midContainer({
    Key key,
  }) : super(key: key);

  @override
  _midContainerState createState() => _midContainerState();
}

TextStyle styleTemplate(double size) {
  return TextStyle(
      fontSize: size,
      color: Color(0xFFAC3939),
      fontWeight: FontWeight.w600,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(0, 1.0),
          blurRadius: 6.0,
          color: Color.fromARGB(200, 0, 0, 0),
        )
      ]);
}

class Variables {
  static double speedSlider = 110;
  static double randomnessSlider = 60;
  static double volumeSlider = 75;
  static double effectVolumeSlider = 70;

  static int dropTestInt = 0;
  static String dropTestString = "";

  static String chosenValueKeyboard;
  static int chosenIndexKeyboard;
  static String chosenValueEffect;
  static int chosenIndexEffect;
}

class _midContainerState extends State<midContainer> {
  @override
  void initState() {
    super.initState();
  }

  var effectIcon = MaterialCommunityIcons.repeat_off;

  changeLoopMode(LoopMode loopMode) async {
    await effectPlayer.setLoopMode(loopMode);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double defaultSize = size.height * 0.061; //60 size.width*0.133
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        // middle container
        //color: Colors.blue[600], //Color(0xFF5F2020), // Colors. blue old color
        width: size.width,
        //height: MediaQuery.of(context).size.height-180,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              0.0, 8.0, 0.0, 16.0), // 0.0, 32.0, 0.0, 32.0
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //color: Colors.orange,
                // mid top container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Colors.white,
                      //color: Color(0xFF5F2020), // Colors.grey old color
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Speed",
                                  style: styleTemplate(defaultSize),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: SizedBox(
                                  width: size.height *
                                      0.082, // 80 size.width*0.177
                                  height:
                                      size.height * 0.041, // 40 size.width*0.88
                                  child: FloatingActionButton(
                                    splashColor:
                                        Color(0xFFAC3939).withAlpha(180),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color(0xFF490404), width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(7.0, 7.0))),
                                    backgroundColor:
                                        Color(0xFF630B0B), //0xFF912626
                                    onPressed: () {
                                      // default on pressed
                                      setState(() {
                                        //print(
                                        //    "BEFORE -- speed: $Variables.speedSlider - randomness: $Variables.randomnessSlider - volume: $Variables.volumeSlider");
                                        Variables.speedSlider = 110;
                                        Variables.randomnessSlider = 60;
                                        Variables.volumeSlider = 75;
                                        //sliderValue = 50;
                                        //print(
                                        //    "AFTER -- speed: $Variables.speedSlider - randomness: $Variables.randomnessSlider - volume: $Variables.volumeSlider");
                                        //effectVolumeSlider = 80;
                                      });
                                    },
                                    child: Text(
                                      "Default",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: size.height * 0.022, // 22
                                          color: Color(0xFFAC3939),
                                          fontWeight: FontWeight.w600,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0, 1.0),
                                              blurRadius: 6.0,
                                              color:
                                                  Color.fromARGB(200, 0, 0, 0),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: sliderWidget(
                              sliderVal: 1,
                              min: 10.0,
                              max: 150.0,
                            ), // speed slider
                          )
                        ],
                      ),
                    ),
                    Container(
                      //color: Color(0xFF5F2020), // Colors.grey[300] old color
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Randomness",
                                  style: styleTemplate(defaultSize),
                                ),
                              )),
                          sliderWidget(
                              sliderVal: 2,
                              min: 1.0,
                              max: 150.0) // randomness slider
                        ],
                      ),
                    ),
                    Container(
                      //color: Color(0xFF5F2020), // Colors.grey old color
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Volume",
                                style: styleTemplate(defaultSize),
                              ),
                            ),
                          ),
                          sliderWidget(
                            sliderVal: 3,
                            min: 0.0,
                            max: 100.0,
                          ) // volume slider
                        ],
                      ),
                    ),
                    Container(
                      //), // Colors.grey[300] old color
                      width: MediaQuery.of(context).size.width,
                      //height: 40,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: dropdownListKeyboard(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.blue[200],
                // mid bot container
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        //color: Color(0xFF5F2020), // Colors.grey old color
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        "Effects",
                                        style: styleTemplate(defaultSize),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: SizedBox(
                                    width: size.height *
                                        0.082, // 80 size.width*0.177
                                    height: size.height *
                                        0.041, // 40 size.width*0.88
                                    child: FloatingActionButton(
                                      splashColor:
                                          Color(0xFFAC3939).withAlpha(180),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFF490404),
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(7.0, 7.0))),
                                      backgroundColor:
                                          Color(0xFF630B0B), //0xFF912626
                                      onPressed: () {
                                        setState(() {
                                          if (effectIcon ==
                                              MaterialCommunityIcons.repeat) {
                                            effectIcon = MaterialCommunityIcons
                                                .repeat_off;
                                            changeLoopMode(LoopMode.off);
                                          } else if (effectIcon ==
                                              MaterialCommunityIcons
                                                  .repeat_off) {
                                            effectIcon =
                                                MaterialCommunityIcons.repeat;
                                            changeLoopMode(LoopMode.one);
                                          }
                                        });
                                      },
                                      child: Icon(effectIcon,
                                          color: Color(0xFFAC3939)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: dropdownListEffect(),
                                ))
                          ],
                        )),
                    Container(
                      //color: Color(0xFF5F2020), // Colors.grey[300] old color
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Effect Volume",
                                  style: styleTemplate(defaultSize),
                                ),
                              )),
                          sliderWidget(
                              sliderVal: 4,
                              min: 0.0,
                              max: 100.0), // effect volume slider
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class sliderWidget extends StatefulWidget {
  sliderWidget({Key key, this.sliderVal, this.min, this.max}) : super(key: key);
  int sliderVal;
  double min;
  double max;
  @override
  _sliderWidgetState createState() => _sliderWidgetState();
}

class _sliderWidgetState extends State<sliderWidget> {
  double sliderValue;

  returnYarrak() {
    switch (widget.sliderVal) {
      case 1: // speed slider
        sliderValue = Variables.speedSlider;
        return sliderValue;
        break;
      case 2: // randomness slider
        sliderValue = Variables.randomnessSlider;
        return sliderValue;
        break;
      case 3: // volume slider
        sliderValue = Variables.volumeSlider;
        return sliderValue;
        break;
      case 4: // effect volume slider
        sliderValue = Variables.effectVolumeSlider;
        return sliderValue;
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //width: MediaQuery.of(context).size.width,
      child: SliderTheme(
        data: SliderThemeData(
            trackHeight: size.height * 0.016, // 16 size.width * 0.035
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: size.height * 0.012, // 12
            ),
            thumbColor: Colors.orange[800],
            activeTrackColor: Color(0xFF500C13), //0xFF5A1017
            inactiveTrackColor: Color(0xFF9E2D2D), //7a201e 7b201f
            overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
            overlayColor: Colors.red.withAlpha(32)),
        child: Slider(
          label: "$sliderValue",
          value: returnYarrak(),
          onChanged: (double val) {
            //print("val: $val");
            setState(() {
              sliderValue = val;
              switch (widget.sliderVal) {
                case 1: // speed slider
                  Variables.speedSlider = val;
                  sliderValue = val;
                  break;
                case 2: // randomness slider
                  Variables.randomnessSlider = val;
                  sliderValue = val;
                  break;
                case 3: // volume slider
                  Variables.volumeSlider = val;
                  sliderValue = val;
                  break;
                case 4: // effect volume slider
                  Variables.effectVolumeSlider = val;
                  sliderValue = val;
                  effectPlayer.setVolume(val / 100.0);
                  break;
                default:
              }
            });
          },
          min: widget.min,
          max: widget.max,
        ),
      ),
    );
  }
}

class dropdownListKeyboard extends StatefulWidget {
  dropdownListKeyboard({Key key}) : super(key: key);

  @override
  _dropdownListKeyboardState createState() => _dropdownListKeyboardState();
}

var effectPlayer = AudioPlayer();

class _dropdownListKeyboardState extends State<dropdownListKeyboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.pink[400],
      height: size.height * 0.066, // 65 size.width * 0.143
      decoration: BoxDecoration(
        color: Color(0xFFAC3939),
        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
        border: Border.all(width: 2.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 2.0),
            child: Icon(
              FontAwesome
                  .keyboard_o, // FontAwesome.keyboard_o Icons.keyboard_outlined
              color: Color(0xFF7A1818),
            ),
          ),
          isExpanded: true,
          value: Variables.chosenValueKeyboard,
          onChanged: (String val) {
            setState(() {
              Variables.chosenValueKeyboard = val;
            });
          },
          dropdownColor: Color(0xFFAC3939),
          autofocus: true,
          hint: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: Container(
              child: AutoSizeText(
                "Select a keyboard type",
                maxLines: 1,
                style: TextStyle(
                    fontSize: size.height * 0.041, // 40
                    color: Color(0xFF500C13)),
              ),
            ),
          ),
          items: [
            'Soft',
            'Regular',
            'Loose',
            'Old',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                child: Text(value,
                    style: TextStyle(
                        fontSize: size.height * 0.041, // 40
                        color: Color(0xFF500C13))),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class dropdownListEffect extends StatefulWidget {
  dropdownListEffect({Key key}) : super(key: key);

  @override
  _dropdownListEffectState createState() => _dropdownListEffectState();
}

stopPlayer() async {
  await effectPlayer.pause();
  await effectPlayer.seek(Duration.zero);
}

startPlayer(String path) async {
  await effectPlayer.setAsset(path);
  await effectPlayer.play();
}

class _dropdownListEffectState extends State<dropdownListEffect> {
  String path;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.066, // 65 size.width * 0.143
      decoration: BoxDecoration(
          color: Color(0xFFAC3939),
          borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
          border: Border.all(width: 2.0)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: Icon(
              MaterialIcons.audiotrack,
              color: Color(0xFF7A1818), // 0xFFAC3939
            ),
          ),
          isExpanded: true,
          value: Variables.chosenValueEffect,
          onChanged: (String val) {
            setState(() {
              Variables.chosenValueEffect = val;
              effectPlayer.setVolume(Variables.effectVolumeSlider / 100);
              switch (val) {
                case 'None':
                  stopPlayer();
                  break;
                case 'Fireplace':
                  stopPlayer();
                  path = "audios/effects/fireplace.mp3";
                  startPlayer(path);
                  break;
                case 'Rain':
                  stopPlayer();
                  path = "audios/effects/2rain.mp3";
                  startPlayer(path);
                  break;
                case 'Rain 2':
                  stopPlayer();
                  path = "audios/effects/3rainSofter.mp3";
                  startPlayer(path);
                  break;
                case 'Homie Cat - Downtown Cafe':
                  stopPlayer();
                  path = "audios/effects/HomieCatDowntownCafe.mp3";
                  startPlayer(path);
                  break;
                case 'Kaizan Blu - 4AM':
                  stopPlayer();
                  path = "audios/effects/KaizanBlu4AM.mp3";
                  startPlayer(path);
                  break;
                case 'LFM - Isolated Aren\'t We All':
                  stopPlayer();
                  path =
                      "audios/effects/6LowFrequencyMusicIsolatedArentWeAll.mp3";
                  startPlayer(path);
                  break;
                case 'Sound of Silence (LoFi)':
                  stopPlayer();
                  path = "audios/effects/soundOfSilenceLofi.mp3";
                  startPlayer(path);
                  break;
              }
            });
          },
          dropdownColor: Color(0xFFAC3939),
          autofocus: true,
          hint: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: Container(
              child: AutoSizeText(
                'Select an effect type',
                maxLines: 1,
                style: TextStyle(
                    fontSize: size.height * 0.041, // 40
                    color: Color(0xFF500C13)),
              ),
            ),
          ),
          items: <String>[
            'None',
            'Fireplace',
            'Rain',
            'Rain 2',
            'Homie Cat - Downtown Cafe',
            'Kaizan Blu - 4AM',
            'LFM - Isolated Aren\'t We All',
            'Sound of Silence (LoFi)'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                child: AutoSizeText(
                  value,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: size.height * 0.041, // 40
                      color: Color(0xFF500C13)),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
