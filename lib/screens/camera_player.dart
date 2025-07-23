import 'package:cameramulti/utils/module_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraPlayer extends StatefulWidget {
  const CameraPlayer({super.key});

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();
}

class _CameraPlayerState extends State<CameraPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Camera Multi',
            style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 14),
          ),
          Expanded(
              child: defaultTargetPlatform == TargetPlatform.android
                  ? AndroidView(
                      viewType: ModuleChannel.viewPlayer,
                      creationParams: const {
                        "uuid": "H23R9K94ZULVDVCF111A",
                        "pass": "Js2nvQ",
                        "height": 0,
                        "width": 0,
                        "type": 0,
                        "mic": 1,
                        "sound": 1
                      },
                      layoutDirection: TextDirection.ltr,
                      creationParamsCodec: const StandardMessageCodec(),
                    )
                  : UiKitView(
                      viewType: ModuleChannel.viewPlayer,
                      creationParams: const {
                        "uuid": "H23R9K94ZULVDVCF111A",
                        "pass": "Js2nvQ",
                        "height": 500,
                        "width": 1000,
                        "type": 0,
                        "mic": 0,
                        "sound": 0
                      },
                      layoutDirection: TextDirection.ltr,
                      creationParamsCodec: const StandardMessageCodec(),
                    ))
        ],
      ),
    );
  }
}
