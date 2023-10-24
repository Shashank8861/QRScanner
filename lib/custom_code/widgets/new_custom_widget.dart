// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  int _counter = 0;
  late Uint8List _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Screenshot(
          controller: screenshotController,
          child: Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await Share.share(
                  '',
                  sharePositionOrigin: getWidgetBoundingBox(context),
                );
              },
              child: BarcodeWidget(
                data: FFAppState().qr,
                barcode: Barcode.qrCode(),
                width: 200,
                height: 200,
                color: FlutterFlowTheme.of(context).primaryText,
                backgroundColor: Colors.transparent,
                errorBuilder: (_context, _error) => SizedBox(
                  width: 200,
                  height: 200,
                ),
                drawText: false,
              ),
            ),
          )),
      ElevatedButton(
          child: Text("take screenshot"),
          onPressed: () {
            screenshotController
                .capture()
                .then((Uint8List image) {
                  //Capture Done
                  setState(() {
                    _imageFile = image;
                  });
                } as FutureOr Function(Uint8List? value))
                .catchError((onError) {
              print(onError);
            });
          })
    ]);
  }
}
