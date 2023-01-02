import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("in build");

    return MaterialApp(
      title: 'Virtual CDU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///////////////////////////////////////
/// constants
///////////////////////////////////////
////////////////////////////////////
/// line select keys (LSK)
/////////////////////////////////////
const skBackgroundColor = Colors.transparent;

const double lskWidth = 50;
const double lskHeight = 30;

const double lskLeftX = 10;
const double lskRightX = 540;

const double lskRow1Y = 115;
const double lskRow2Y = 165;
const double lskRow3Y = 210;
const double lskRow4Y = 260;
const double lskRow5Y = 310;
const double lskRow6Y = 360;

///////////////////////////////////////////////
///  function keys
//////////////////////////////////////////////
const funcBackgroundColor = Colors.pink;

const double funcWidth = 70;
const double funcHeight = 40;

const double funcRow1Y = 475;
const double funcRow2Y = 535;
const double funcRow3Y = 595;
const double funcRow4Y = 660;

const double funcCol1X = 60;
const double funcCol2X = 135;
const double funcCol3X = 210;
const double funcCol4X = 285;
const double funcCol5X = 360;
const double funcCol6X = 465;

/////////////////////////////////////////////////
/// alpha keys
////////////////////////////////////////////////
const alphaBackgroundColor = Colors.red;

const double alphaWidth = 55;
const double alphaHeight = 45;

const double alphaRow1Y = 595;
const double alphaRow2Y = 655;
const double alphaRow3Y = 715;
const double alphaRow4Y = 770;
const double alphaRow5Y = 835;
const double alphaRow6Y = 890;

const double alphaCol1X = 245;
const double alphaCol2X = 305;
const double alphaCol3X = 365;
const double alphaCol4X = 427;
const double alphaCol5X = 490;

////////////////////////////////////////////////
/// numeric keys
///////////////////////////////////////////////
const numBackgroundColor = Colors.orange;

const double numWidth = 50;
const double numHeight = 45;

const double numRow1Y = 715;
const double numRow2Y = 775;
const double numRow3Y = 830;
const double numRow4Y = 890;

const double numCol1X = 60;
const double numCol2X = 120;
const double numCol3X = 185;

/// display lines
const Color lineBackgroundColor = Colors.black;

//////////////////////
/// Title  /instrumentation/cdu/output/title
/// //////////////////
const double lineTitleX = 180;
const double lineTitleY = 57;
const double lineTitleWidth = 200;
const double lineTitleHeight = 30;

///////////////////////
/// page  /instrumentation/cdu/output/page
//////////////////////
const double linePageX = 445;
const double linePageY = 65;
const double linePageWidth = 50;
const double linePageHeight = 20;

//////
/// common offsets for all lines
///////
const double lineLineTitleHeight = 20;
const double lineLineTitleLargeHeight = 20;
const double lineLineHeight = 20;

const double lineLeftColWidth = 120;
const double lineCenterColWidth = 150;
const double lineRightColWidth = 220;
const double lineCenterLeftColWidth = 50;
const double lineCenterRightColWidth = 50;

const double lineLineSmallHeight = 0;
const double lineLineSmallWidth = 0;

const double lineColLeftX = 95;
const double lineColCenterX = 230;
const double lineColCenterLeftX = 230;
const double lineColCenterRightX = 320;
const double lineColRightX = 290;

const double linePageTitleFontSize = 26;
const double linePageFontSize = 20;

const double lineTitleFontSize = 17;
const double lineFontSize = 20;
const double lineSmallFontSize = 25;

const Color textColor = Colors.white;

//////////////////////
// line1
//  |----------------------|---------|-------|---------|-------------|
//  |  Left Title          |    center Title           | Right Title |
//  |  Left                | C Left  | Center| C Right | Right       |
//  |----------------------|---------|-------|---------|-------------|
/////////////////

// offset in Y direction relative to top of the line box
const double titleTextOffset = 0;
const double normalTextOffset = 25;
const double smallTextOffset = 50;
const double centerLeftTextOffset = 50;
const double centerRightTextOffset = 100;

const double lineSpacingOffset = 50;

const double lineLine1Y = 90;
const double lineLine2Y = lineLine1Y + lineSpacingOffset;
const double lineLine3Y = lineLine2Y + lineSpacingOffset;
const double lineLine4Y = lineLine3Y + lineSpacingOffset;

const double lineLine5Y = lineLine4Y + lineSpacingOffset;

const double lineLine6Y = lineLine5Y + lineSpacingOffset;

//////////////////////
/// Title  /instrumentation/cdu/output/title
/// //////////////////
//const double lineScratchBufX = 180;
const double lineScratchBufY = 385;
const double lineScratchBufWidth = 400;
const double lineScratchBufHeight = 30;

////////////////////////////////////////////////
/// indexes
/// these indexes are synchronized with the generic protocol xml file
///////////////////////////////////////////////
const int lineTitleIndex = 0;
const int linePageIndex = 1;

const int lineLine1LeftTitleIndex = 2;
const int lineLine1LeftIndex = 3;
const int lineLine1LeftSmallIndex = 4;
const int lineLine1CenterTitleIndex = 5;
const int lineLine1CenterTitleLargeIndex = 6;
const int lineLine1CenterIndex = 7;
const int lineLine1CenterLeftIndex = 8;
const int lineLine1CenterRightIndex = 9;
const int lineLine1RightTitleIndex = 10;
const int lineLine1RightIndex = 11;
const int lineLine1RightSmallIndex = 12;

const int lineLine2LeftTitleIndex = 13;
const int lineLine2LeftIndex = 14;
const int lineLine2LeftSmallIndex = 15;
const int lineLine2CenterTitleIndex = 16;
const int lineLine2CenterIndex = 17;
const int lineLine2CenterLeftIndex = 18;
const int lineLine2CenterRightIndex = 19;
const int lineLine2RightTitleIndex = 20;
const int lineLine2RightIndex = 21;
const int lineLine2RightSmallIndex = 22;

const int lineLine3LeftTitleIndex = 23;
const int lineLine3LeftIndex = 24;
const int lineLine3LeftSmallIndex = 25;
const int lineLine3CenterTitleIndex = 26;
const int lineLine3CenterIndex = 27;
const int lineLine3CenterLeftIndex = 28;
const int lineLine3CenterRightIndex = 29;
const int lineLine3RightTitleIndex = 30;
const int lineLine3RightIndex = 31;
const int lineLine3RightSmallIndex = 32;

const int lineLine4LeftTitleIndex = 33;
const int lineLine4LeftIndex = 34;
const int lineLine4LeftSmallIndex = 35;
const int lineLine4CenterTitleIndex = 36;
const int lineLine4CenterIndex = 37;
const int lineLine4CenterLeftIndex = 38;
const int lineLine4CenterRightIndex = 39;
const int lineLine4RightTitleIndex = 40;
const int lineLine4RightIndex = 41;
const int lineLine4RightSmallIndex = 42;

const int lineLine5LeftTitleIndex = 43;
const int lineLine5LeftIndex = 44;
const int lineLine5LeftSmallIndex = 45;
const int lineLine5CenterTitleIndex = 46;
const int lineLine5CenterTitleLargeIndex = 47;
const int lineLine5CenterIndex = 48;
const int lineLine5CenterLeftIndex = 49;
const int lineLine5CenterRightIndex = 50;
const int lineLine5RightTitleIndex = 51;
const int lineLine5RightIndex = 52;
const int lineLine5RightSmallIndex = 53;

const int lineLine6LeftTitleIndex = 54;
const int lineLine6LeftIndex = 55;
const int lineLine6LeftSmallIndex = 56;
const int lineLine6CenterTitleIndex = 57;
const int lineLine6CenterTitleLargeIndex = 58;
const int lineLine6CenterIndex = 59;
const int lineLine6CenterLeftIndex = 60;
const int lineLine6CenterRightIndex = 61;
const int lineLine6RightTitleIndex = 62;
const int lineLine6RightIndex = 63;
const int lineLine6RightSmallIndex = 64;

const int lineScratchBuffIndex = 65;

const int lineEndIndex = 66;

///////////////////////////////////////////
///
////////////////////////////////////////////
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _ctlr = TextEditingController();
  List<String> inputArray = List<String>.filled(100 /*lineEndIndex*/, "");

  int listenPort = 9210;
  var sendPort = 9208;
  String myIPAddress = "";
  String hostIPAddress = "";

  bool inInitMode = true;

  String backgroundImage = "assets/images/Virtual-CDU-777.png";
  String greyBackgroundImage = "assets/images/boeing_grey.png";
  String lightmapBackgroundImage = "assets/images/boeing_lightmap.png";
  String brownBackgroundImage = "assets/images/boeing_brown.png";

  // constructor
  _MyHomePageState() {
    debugPrint("in myclassstate constructor");
  }

  @override
  void initState() {
    super.initState();

    setInitMode();

    debugPrint("Getting IP Adress");
    inputArray[lineScratchBuffIndex] = "Getting IP Address";

    gettingIP().then((ip) {
      debugPrint("IP => $ip");

      if (ip != null) {
        myIPAddress = ip;

        inputArray[lineLine1RightIndex] = myIPAddress;
        inputArray[lineScratchBuffIndex] = "";
      } else {
        inputArray[lineLine1RightIndex] = "ERROR";
      }
      update();
    }).catchError((onError) {
      debugPrint('Error getting IP ==> $onError');
    });
  }

  // setInitMode
  void setInitMode() {
    inInitMode = true;

    backgroundImage = brownBackgroundImage;

    inputArray[lineTitleIndex] = "CONFIG";
    inputArray[lineLine1RightTitleIndex] = "CDU IP Address";
    inputArray[lineLine1LeftTitleIndex] = "FG Address";
    inputArray[lineLine2LeftTitleIndex] = "FG send Port";
    inputArray[lineLine2RightTitleIndex] = "FG recv  Port";

    inputArray[lineLine3LeftIndex] = "Grey";
    inputArray[lineLine4LeftIndex] = "Brown";
    inputArray[lineLine5LeftIndex] = "Lighted";

    inputArray[lineLine1RightIndex] = myIPAddress;
    inputArray[lineScratchBuffIndex] = "";
  }

// read data over UDP
  void readData() {
    RawDatagramSocket.bind(InternetAddress.anyIPv4, listenPort)
        .then((RawDatagramSocket socket) {
      socket.listen((RawSocketEvent e) {
        Datagram? d = socket.receive();
        if (d != null) {
          String message = new String.fromCharCodes(d.data).trim();
          debugPrint(
              'Datagram from ${d.address.address}:${d.port}: ${message}');
          //entries.add(message);

          setInput(message.split(","));
        }
      });
    });
  }

  // send data over UDP
  void sendData(String msg) {
    // add newline
    msg = '$msg\n';

    RawDatagramSocket.bind(InternetAddress.anyIPv4, sendPort).then((socket) {
      debugPrint("sending $msg");

      socket.send(const Utf8Codec().encode(msg), InternetAddress(hostIPAddress),
          sendPort);
      // socket.listen((event) {
      //   debugPrint("sending $msg");

      //  if (event == RawSocketEvent.write) {
      //    socket.close();
      //   debugPrint("socket closed");
      // }
    }).catchError((onError) {
      debugPrint('$onError');
    });
  }

  gettingIP() async {
    await Permission.location.request();
    final info = NetworkInfo();
    var hostAddress = await info.getWifiIP();
    return hostAddress;
  }

  // build
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: renderWidgets(),
        ),
      ),
    ));
  }

/////////////////////////////////////////////////////////////////////////
  ///
  ///
  Widget renderLineSegment(leftOffset, topOffset, height, width, fontSize,
      textColor, justify, text) {
    return (Positioned(
      left: leftOffset,
      top: topOffset,
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          color: lineBackgroundColor.withOpacity(0.0),
          alignment: justify,
          child: Text(
            "$text",
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    ));
  }

  Widget renderButton(
      leftOffset, rightOffset, height, width, Color bgColor, param) {
    return (Positioned(
      left: leftOffset,
      top: rightOffset,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor.withOpacity(0.0),
          ),
          child: const Text(
            "",
          ),
          onPressed: () {
            buttonPressed(param);
          },
        ),
      ),
    ));
  }

  Widget renderLED(
      leftOffset, rightOffset, height, width, Color bgColor, param) {
    return (Positioned(
      left: leftOffset,
      top: rightOffset,
      child: SizedBox(
        height: height,
        width: width,
        child: const Text(
          "",
        ),
      ),
    ));
  }

//////////////////////////////////////////////////////////////////
  void setInput(List<String> l) {
    bool isChanged = false;

    for (var i = 0; i < l.length; i++) {
      if (inputArray[i] != l[i]) {
        // only copy if changed
        inputArray[i] = l[i];
        isChanged = true;
      }
    }

    if (isChanged) {
      debugPrint("change detected... uptating");
      update();
    }
  }

  void buttonPressed(String button) {
    debugPrint("button => $button");

    if (inInitMode == false && button != "BtnProg") {
      // send the button directly to the FG
      sendData(button);
      return;
    }

    // we are still initialization mode.
    // ignore anything other than the numeric and CLR keys
    // add key pressed to the scratch buffer
    // if LSK1 or LSK3 is pressed store scratch buffer
    if (button == "LSK1L") {
      inputArray[lineLine1LeftIndex] = inputArray[lineScratchBuffIndex];
      inputArray[lineScratchBuffIndex] = "";
      update();
    } else if (button == "LSK2L") {
      inputArray[lineLine2LeftIndex] = inputArray[lineScratchBuffIndex];
      inputArray[lineScratchBuffIndex] = "";
      update();
    } else if (button == "LSK2R") {
      inputArray[lineLine2RightIndex] = inputArray[lineScratchBuffIndex];
      inputArray[lineScratchBuffIndex] = "";
      update();
    } else if (button == "LSK3L") {
      backgroundImage = greyBackgroundImage;
      update();
    } else if (button == "LSK4L") {
      backgroundImage = brownBackgroundImage;
      update();
    } else if (button == "LSK5L") {
      backgroundImage = lightmapBackgroundImage;
      update();
    } else if (button == "CLR") {
      // remove last character if there are any
      if (inputArray[lineScratchBuffIndex].length > 0) {
        inputArray[lineScratchBuffIndex] = inputArray[lineScratchBuffIndex]
            .substring(0, inputArray[lineScratchBuffIndex].length - 1);

        update();
      }
    } else if (button == "BtnExec") {
      hostIPAddress = inputArray[lineLine1LeftIndex];
      listenPort = int.parse(inputArray[lineLine2LeftIndex]);
      sendPort = int.parse(inputArray[lineLine2RightIndex]);

      debugPrint("reading data over UDP ==> $hostIPAddress:$listenPort");

      final periodicTimer =
          Timer.periodic(const Duration(seconds: 10), (timer) {
        debugPrint("tick");
        readData();
      });

      inInitMode = false;
    } else if (button == "BtnProg") {
      // use this unused button to send back to the initialization mode
      setInitMode();
      update();
    } else if (button == "0" ||
        button == "1" ||
        button == "2" ||
        button == "3" ||
        button == "4" ||
        button == "5" ||
        button == "6" ||
        button == "7" ||
        button == "8" ||
        button == "9" ||
        button == ".") {
      // add to scratch buf
      inputArray[lineScratchBuffIndex] =
          inputArray[lineScratchBuffIndex] + button;
      update();
    }

    // ignore everything else
  }

  void update() {
    setState(() {
      debugPrint("updating state");
    });
  }

  Widget renderLSKButton(leftOffset, rightOffset, param) {
    return renderButton(
        leftOffset, rightOffset, lskHeight, lskWidth, skBackgroundColor, param);
  }

  Widget renderNumberButton(leftOffset, rightOffset, param) {
    return renderButton(leftOffset, rightOffset, numHeight, numWidth,
        numBackgroundColor, param);
  }

  Widget renderAlphaButton(leftOffset, rightOffset, param) {
    return renderButton(leftOffset, rightOffset, alphaHeight, alphaWidth,
        alphaBackgroundColor, param);
  }

  Widget renderFunctionButton(leftOffset, rightOffset, param) {
    return renderButton(leftOffset, rightOffset, funcHeight, funcWidth,
        funcBackgroundColor, param);
  }

  Widget renderTitleLine() {
    return renderLineSegment(
        lineTitleX,
        lineTitleY,
        lineTitleHeight,
        lineTitleWidth,
        linePageTitleFontSize,
        textColor,
        Alignment.center,
        inputArray[lineTitleIndex]);
  }

  Widget renderPageLine() {
    return renderLineSegment(
        linePageX,
        linePageY,
        linePageHeight,
        linePageWidth,
        linePageFontSize,
        textColor,
        Alignment.centerRight,
        inputArray[linePageIndex]);
  }

  Widget renderLineLeftTitle(double topOffset, text) {
    return renderLineSegment(
        lineColLeftX,
        topOffset,
        lineLineTitleHeight,
        lineLeftColWidth,
        lineTitleFontSize,
        textColor,
        Alignment.centerLeft,
        text);
  }

  Widget renderLineLeft(double topOffset, text) {
    return renderLineSegment(lineColLeftX, topOffset, lineLineHeight,
        lineLeftColWidth, lineFontSize, textColor, Alignment.centerLeft, text);
  }

  Widget renderLineLeftSmall(double topOffset, text) {
    return renderLineSegment(
        lineColLeftX,
        topOffset,
        lineLineSmallHeight,
        lineLeftColWidth,
        lineSmallFontSize,
        textColor,
        Alignment.centerLeft,
        text);
  }

  Widget renderLineCenterTitle(double topOffset, text) {
    return renderLineSegment(
        lineColCenterX,
        topOffset,
        lineLineTitleHeight,
        lineCenterColWidth,
        lineTitleFontSize,
        textColor,
        Alignment.center,
        text);
  }

  Widget renderLineCenterTitleLarge(double leftOffset, double topOffset, text) {
    return renderLineSegment(
        leftOffset,
        topOffset,
        lineLineTitleLargeHeight,
        lineCenterColWidth,
        lineTitleFontSize,
        textColor,
        Alignment.center,
        text);
  }

  Widget renderLineCenter(double topOffset, text) {
    return renderLineSegment(lineColCenterX, topOffset, lineLineHeight,
        lineCenterColWidth, lineFontSize, textColor, Alignment.center, text);
  }

  Widget renderLineCenterLeft(double topOffset, text) {
    return renderLineSegment(
        lineColCenterLeftX,
        topOffset,
        lineLineHeight,
        lineCenterLeftColWidth,
        lineFontSize,
        textColor,
        Alignment.center,
        text);
  }

  Widget renderLineCenterRight(double topOffset, text) {
    return renderLineSegment(
        lineColCenterRightX,
        topOffset,
        lineLineHeight,
        lineCenterRightColWidth,
        lineFontSize,
        textColor,
        Alignment.centerRight,
        text);
  }

  Widget renderLineRightTitle(double topOffset, text) {
    return renderLineSegment(
        lineColRightX,
        topOffset,
        lineLineTitleHeight,
        lineRightColWidth,
        lineTitleFontSize,
        textColor,
        Alignment.center,
        text);
  }

  Widget renderLineRight(double topOffset, text) {
    return renderLineSegment(
        lineColRightX,
        topOffset,
        lineLineHeight,
        lineRightColWidth,
        lineFontSize,
        textColor,
        Alignment.centerRight,
        text);
  }

  Widget renderLineRightSmall(double topOffset, text) {
    return renderLineSegment(
        lineColRightX,
        topOffset,
        lineLineSmallHeight,
        lineRightColWidth,
        lineSmallFontSize,
        textColor,
        Alignment.centerRight,
        text);
  }

  List<Widget> renderLine(
      bool titleLargeFlag,
      double topOffset,
      leftTitleText,
      leftText,
      leftSmallText,
      centerTitleText,
      centerTitleLargeText,
      centerText,
      centerLeftText,
      centerRightText,
      rightTitleText,
      rightText,
      rightSmallText) {
    double lineLineLeftTitleY = topOffset + titleTextOffset;
    double lineLineLeftY = topOffset + normalTextOffset;
    double lineLineLeftSmallY = topOffset + smallTextOffset;
    double lineLineCenterTitleY = topOffset + titleTextOffset;
    double lineLineCenterTitleLargeX = 0;
    double lineLineCenterTitleLargeY = 0;
    double lineLineCenterY = topOffset + normalTextOffset;
    double lineLineCenterLeftY = topOffset + normalTextOffset;
    double lineLineCenterRightY = topOffset + normalTextOffset;
    double lineLineRightTitleY = topOffset + titleTextOffset;
    double lineLineRightY = topOffset + normalTextOffset;
    double lineLineRightSmallY = 0;

    List<Widget> l = [];

    // left
    l.add(renderLineLeftTitle(lineLineLeftTitleY, leftTitleText));
    l.add(renderLineLeft(lineLineLeftY, leftText));
    //l.add(renderLineLeftSmall(lineLineLeftSmallY, leftSmallText));

    // center
    l.add(renderLineCenterTitle(lineLineCenterTitleY, centerTitleText));

    if (titleLargeFlag) {
      //l.add(renderLineCenterTitleLarge(lineLineCenterTitleLargeX,
      //    lineLineCenterTitleLargeY, centerTitleLargeText));
    }
    l.add(renderLineCenter(lineLineCenterY, centerText));
    l.add(renderLineCenterLeft(lineLineCenterLeftY, centerLeftText));
    l.add(renderLineCenterRight(lineLineCenterRightY, centerRightText));

    // right
    l.add(renderLineRightTitle(lineLineRightTitleY, rightTitleText));
    l.add(renderLineRight(lineLineRightY, rightText));
    //l.add(renderLineRightSmall(lineLineRightSmallY, rightSmallText));

    return (l);
  }

// for lines 1, 5 and 6
  List<Widget> renderLine156(
      double topOffset,
      leftTitleText,
      leftText,
      leftSmallText,
      centerTitleText,
      centerTitleLargeText,
      centerText,
      centerLeftText,
      centerRightText,
      rightTitleText,
      rightText,
      rightSmallText) {
    return (renderLine(
        true,
        topOffset,
        leftTitleText,
        leftText,
        leftSmallText,
        centerTitleText,
        centerTitleLargeText,
        centerText,
        centerLeftText,
        centerRightText,
        rightTitleText,
        rightText,
        rightSmallText));
  }

// for line 2,3 and 4
  List<Widget> renderLine234(
      double topOffset,
      leftTitleText,
      leftText,
      leftSmallText,
      centerTitleText,
      centerTitleLargeText,
      centerText,
      centerLeftText,
      centerRightText,
      rightTitleText,
      rightText,
      rightSmallText) {
    return (renderLine(
        false,
        topOffset,
        leftTitleText,
        leftText,
        leftSmallText,
        centerTitleText,
        centerTitleLargeText,
        centerText,
        centerLeftText,
        centerRightText,
        rightTitleText,
        rightText,
        rightSmallText));
  }

  List<Widget> renderDisplayLine1() {
    return (renderLine156(
        lineLine1Y,
        inputArray[lineLine1LeftTitleIndex],
        inputArray[lineLine1LeftIndex],
        inputArray[lineLine1LeftSmallIndex],
        inputArray[lineLine1CenterTitleIndex],
        inputArray[lineLine1CenterTitleLargeIndex],
        inputArray[lineLine1CenterIndex],
        inputArray[lineLine1CenterLeftIndex],
        inputArray[lineLine1CenterRightIndex],
        inputArray[lineLine1RightTitleIndex],
        inputArray[lineLine1RightIndex],
        inputArray[lineLine1RightSmallIndex]));
  }

  List<Widget> renderDisplayLine2() {
    return (renderLine156(
        lineLine2Y,
        inputArray[lineLine2LeftTitleIndex],
        inputArray[lineLine2LeftIndex],
        inputArray[lineLine2LeftSmallIndex],
        inputArray[lineLine2CenterTitleIndex],
        "",
        inputArray[lineLine2CenterIndex],
        inputArray[lineLine2CenterLeftIndex],
        inputArray[lineLine2CenterRightIndex],
        inputArray[lineLine2RightTitleIndex],
        inputArray[lineLine2RightIndex],
        inputArray[lineLine2RightSmallIndex]));
  }

  List<Widget> renderDisplayLine3() {
    return (renderLine156(
        lineLine3Y,
        inputArray[lineLine3LeftTitleIndex],
        inputArray[lineLine3LeftIndex],
        inputArray[lineLine3LeftSmallIndex],
        inputArray[lineLine3CenterTitleIndex],
        "",
        inputArray[lineLine3CenterIndex],
        inputArray[lineLine3CenterLeftIndex],
        inputArray[lineLine3CenterRightIndex],
        inputArray[lineLine3RightTitleIndex],
        inputArray[lineLine3RightIndex],
        inputArray[lineLine3RightSmallIndex]));
  }

  List<Widget> renderDisplayLine4() {
    return (renderLine156(
        lineLine4Y,
        inputArray[lineLine4LeftTitleIndex],
        inputArray[lineLine4LeftIndex],
        inputArray[lineLine4LeftSmallIndex],
        inputArray[lineLine4CenterTitleIndex],
        "",
        inputArray[lineLine4CenterIndex],
        inputArray[lineLine4CenterLeftIndex],
        inputArray[lineLine4CenterRightIndex],
        inputArray[lineLine4RightTitleIndex],
        inputArray[lineLine4RightIndex],
        inputArray[lineLine4RightSmallIndex]));
  }

  List<Widget> renderDisplayLine5() {
    return (renderLine156(
        lineLine5Y,
        inputArray[lineLine5LeftTitleIndex],
        inputArray[lineLine5LeftIndex],
        inputArray[lineLine5LeftSmallIndex],
        inputArray[lineLine5CenterTitleIndex],
        inputArray[lineLine5CenterTitleLargeIndex],
        inputArray[lineLine5CenterIndex],
        inputArray[lineLine5CenterLeftIndex],
        inputArray[lineLine5CenterRightIndex],
        inputArray[lineLine5RightTitleIndex],
        inputArray[lineLine5RightIndex],
        inputArray[lineLine5RightSmallIndex]));
  }

  List<Widget> renderDisplayLine6() {
    return (renderLine156(
        lineLine6Y,
        inputArray[lineLine6LeftTitleIndex],
        inputArray[lineLine6LeftIndex],
        inputArray[lineLine6LeftSmallIndex],
        inputArray[lineLine6CenterTitleIndex],
        inputArray[lineLine6CenterTitleLargeIndex],
        inputArray[lineLine6CenterIndex],
        inputArray[lineLine6CenterLeftIndex],
        inputArray[lineLine6CenterRightIndex],
        inputArray[lineLine6RightTitleIndex],
        inputArray[lineLine6RightIndex],
        inputArray[lineLine6RightSmallIndex]));
  }

  Widget renderScratchBuff() {
    return (renderLineSegment(
        lineColLeftX,
        lineScratchBufY,
        lineScratchBufHeight,
        lineScratchBufWidth,
        lineSmallFontSize,
        textColor,
        Alignment.centerLeft,
        inputArray[lineScratchBuffIndex]));
  }

  List<Widget> renderDisplayLines() {
    List<Widget> l = [];

    l.add(renderTitleLine());
    l.add(renderPageLine());

    l.addAll(renderDisplayLine1());
    l.addAll(renderDisplayLine2());
    l.addAll(renderDisplayLine3());
    l.addAll(renderDisplayLine4());
    l.addAll(renderDisplayLine5());
    l.addAll(renderDisplayLine6());
    l.add(renderScratchBuff());

    return (l);
  }

  List<Widget> renderLSKButtons() {
    return ([
      renderLSKButton(lskLeftX, lskRow1Y, "LSK1L"),
      renderLSKButton(lskLeftX, lskRow2Y, "LSK2L"),
      renderLSKButton(lskLeftX, lskRow3Y, "LSK3L"),
      renderLSKButton(lskLeftX, lskRow4Y, "LSK4L"),
      renderLSKButton(lskLeftX, lskRow5Y, "LSK5L"),
      renderLSKButton(lskLeftX, lskRow6Y, "LSK6L"),
      renderLSKButton(lskRightX, lskRow1Y, "LSK1R"),
      renderLSKButton(lskRightX, lskRow2Y, "LSK2R"),
      renderLSKButton(lskRightX, lskRow3Y, "LSK3R"),
      renderLSKButton(lskRightX, lskRow4Y, "LSK4R"),
      renderLSKButton(lskRightX, lskRow5Y, "LSK5R"),
      renderLSKButton(lskRightX, lskRow6Y, "LSK6R"),
    ]);
  }

  List<Widget> renderNumberButtons() {
    return ([
      renderNumberButton(numCol1X, numRow1Y, "1"),
      renderNumberButton(numCol2X, numRow1Y, "2"),
      renderNumberButton(numCol3X, numRow1Y, "3"),
      renderNumberButton(numCol1X, numRow2Y, "4"),
      renderNumberButton(numCol2X, numRow2Y, "5"),
      renderNumberButton(numCol3X, numRow2Y, "6"),
      renderNumberButton(numCol1X, numRow3Y, "7"),
      renderNumberButton(numCol2X, numRow3Y, "8"),
      renderNumberButton(numCol3X, numRow3Y, "9"),
      renderNumberButton(numCol1X, numRow4Y, "."),
      renderNumberButton(numCol2X, numRow4Y, "0"),
      renderNumberButton(numCol3X, numRow4Y, "BtnPlusMinus"),
    ]);
  }

  List<Widget> renderAlphaButtons() {
    return ([
      renderAlphaButton(alphaCol1X, alphaRow1Y, "A"),
      renderAlphaButton(alphaCol2X, alphaRow1Y, "B"),
      renderAlphaButton(alphaCol3X, alphaRow1Y, "C"),
      renderAlphaButton(alphaCol4X, alphaRow1Y, "D"),
      renderAlphaButton(alphaCol5X, alphaRow1Y, "E"),
      renderAlphaButton(alphaCol1X, alphaRow2Y, "F"),
      renderAlphaButton(alphaCol2X, alphaRow2Y, "G"),
      renderAlphaButton(alphaCol3X, alphaRow2Y, "H"),
      renderAlphaButton(alphaCol4X, alphaRow2Y, "I"),
      renderAlphaButton(alphaCol5X, alphaRow2Y, "J"),
      renderAlphaButton(alphaCol1X, alphaRow3Y, "K"),
      renderAlphaButton(alphaCol2X, alphaRow3Y, "L"),
      renderAlphaButton(alphaCol3X, alphaRow3Y, "M"),
      renderAlphaButton(alphaCol4X, alphaRow3Y, "N"),
      renderAlphaButton(alphaCol5X, alphaRow3Y, "O"),
      renderAlphaButton(alphaCol1X, alphaRow4Y, "P"),
      renderAlphaButton(alphaCol2X, alphaRow4Y, "Q"),
      renderAlphaButton(alphaCol3X, alphaRow4Y, "R"),
      renderAlphaButton(alphaCol4X, alphaRow4Y, "S"),
      renderAlphaButton(alphaCol5X, alphaRow4Y, "T"),
      renderAlphaButton(alphaCol1X, alphaRow5Y, "U"),
      renderAlphaButton(alphaCol2X, alphaRow5Y, "V"),
      renderAlphaButton(alphaCol3X, alphaRow5Y, "W"),
      renderAlphaButton(alphaCol4X, alphaRow5Y, "X"),
      renderAlphaButton(alphaCol5X, alphaRow5Y, "Y"),
      renderAlphaButton(alphaCol1X, alphaRow6Y, "Z"),
      renderAlphaButton(alphaCol2X, alphaRow6Y, " "),
      renderAlphaButton(alphaCol3X, alphaRow6Y, "Del"),
      renderAlphaButton(alphaCol4X, alphaRow6Y, "/"),
      renderAlphaButton(alphaCol5X, alphaRow6Y, "CLR"),
    ]);
  }

  List<Widget> renderFunctionButtons() {
    return ([
      renderFunctionButton(funcCol1X, funcRow1Y, "BtnInitRef"),
      renderFunctionButton(funcCol2X, funcRow1Y, "BtnRTE"),
      renderFunctionButton(funcCol3X, funcRow1Y, "BtnDepArr"),
      renderFunctionButton(funcCol4X, funcRow1Y, "BtnAltn"),
      renderFunctionButton(funcCol5X, funcRow1Y, "BtnVNAV"),
      renderFunctionButton(funcCol1X, funcRow2Y, "BtnFix"),
      renderFunctionButton(funcCol2X, funcRow2Y, "BtnLegs"),
      renderFunctionButton(funcCol3X, funcRow2Y, "BtnHold"),
      renderFunctionButton(funcCol4X, funcRow2Y, "BtnFMCComm"),
      renderFunctionButton(funcCol5X, funcRow2Y, "BtnProg"),
      renderFunctionButton(funcCol6X, funcRow2Y, "BtnExec"),
      renderFunctionButton(funcCol1X, funcRow3Y, "BtnMenu"),
      renderFunctionButton(funcCol2X, funcRow3Y, "BtnNavRad"),
      renderFunctionButton(funcCol1X, funcRow4Y, "BtnPrevPage"),
      renderFunctionButton(funcCol2X, funcRow4Y, "BtnNextPage"),
    ]);
  }

  List<Widget> renderWidgets() {
    List<Widget> l = renderLSKButtons();
    l.addAll(renderNumberButtons());
    l.addAll(renderAlphaButtons());
    l.addAll(renderFunctionButtons());
    l.addAll(renderDisplayLines());

    return (l);
  }
}
