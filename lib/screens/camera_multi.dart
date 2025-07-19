import 'package:cameramulti/utils/module_channel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraMulti extends StatefulWidget {
  const CameraMulti({super.key});

  @override
  State<CameraMulti> createState() => _CameraMultiState();
}

class _CameraMultiState extends State<CameraMulti> {
  Map<String, dynamic>? creationParams;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
      ),
      child: Column(
        children: [
          const Text(
            'Camera Multi',
            style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontSize: 14),
          ),
          Expanded(
              child: defaultTargetPlatform == TargetPlatform.android
                  ? AndroidView(
                      viewType: ModuleChannel.viewId,
                      creationParams: const {
                        "uuid": "H23R9K94ZULVDVCF111A",
                        "pass": "Js2nvQ",
                        "height": 500,
                        "width": 1000
                      },
                      layoutDirection: TextDirection.ltr,
                      creationParamsCodec: const StandardMessageCodec(),
                    )
                  : UiKitView(
                      viewType: ModuleChannel.viewId,
                      creationParams: creationParams,
                      layoutDirection: TextDirection.ltr,
                      creationParamsCodec: const StandardMessageCodec(),
                    ))
        ],
      ),
    );
  }
}
