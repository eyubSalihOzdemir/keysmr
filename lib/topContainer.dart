import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class topContainer extends StatelessWidget {
  const topContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          16.0, 8.0, 16.0, 0.0), // 16.0, 38.0, 8.0, 0.0
      child: Container(
        // top container
        //color: Colors.amber,
        width: size.width,
        height: size.height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("KeySMR",
                  style: TextStyle(
                    fontFamily: 'BitPap',
                    fontSize: size.height * 0.082, // 80 size.width*0.178
                    color: Color(0xFFAC3939),
                    fontWeight: FontWeight.w600,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0, 1.0),
                        blurRadius: 6.0,
                        color: Color.fromARGB(200, 0, 0, 0),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 16.0),
              child: FloatingActionButton(
                splashColor: Color(0xFFAC3939).withAlpha(180),
                backgroundColor: Color(0xFF721A1A),
                onPressed: () async {
                  // Information button clicked

                  var alertStyle = AlertStyle(
                    animationType: AnimationType.fromRight,
                    isCloseButton: false,
                    isOverlayTapDismiss: true,
                    descStyle: TextStyle(
                      fontSize: size.height * 0.035,
                      fontFamily: 'BitPap',
                      color: Color(0xFFAC3939),
                      fontWeight: FontWeight.w600,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 1.0),
                          blurRadius: 6.0,
                          color: Color.fromARGB(200, 0, 0, 0),
                        ),
                      ],
                    ),
                    descTextAlign: TextAlign.start,
                    animationDuration: Duration(milliseconds: 200),
                    alertBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xFF500C0C),
                      ),
                    ),
                    backgroundColor: Color(0xFF7A1818),
                    isButtonVisible: false,
                    overlayColor: Colors.black54,
                    titleStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 0.1,
                    ),
                    alertAlignment: Alignment.center,
                  );

                  Alert(
                    context: context,
                    style: alertStyle,
                    title: "",
                    desc:
                        "Use headphones for the best experience.\n\nYou can mail me for any requests, questions or problems:\neyubsalih.ozdemir@gmail.com\n\nHave a relaxing day.",
                  ).show();

                  /* start 
                    await DialogBackground(
                    dialog: AlertDialog(
                      backgroundColor: Color(0xFF7A1818),
                      content: Text(
                          "Use headphones for the best experience.\n\nYou can mail me for any requests, questions or problems:\neyubsalih.ozdemir@gmail.com\n\nHave a relaxing day."),
                      contentPadding: EdgeInsets.all(16.0),
                      contentTextStyle: TextStyle(
                        fontSize: size.height * 0.035,
                        fontFamily: 'BitPap',
                        color: Color(0xFFAC3939),
                        fontWeight: FontWeight.w600,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 1.0),
                            blurRadius: 6.0,
                            color: Color.fromARGB(200, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    blur: 3,
                  ).show(context);
                  end */
                },
                child: Center(
                  child: Icon(Icons.info_rounded,
                      color: Colors.red[900], size: size.height * 0.056 // 55
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
