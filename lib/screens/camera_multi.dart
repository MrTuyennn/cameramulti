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
  final List<Map<String, String>> lsCameraMulti = [
    {'uuid': 'CU2X6J5XA2GZVE3X111A', 'user': 'admin', 'pass': 'Rihsk9'},
    {'uuid': '5DFXTGZCRY39KDZM111A', 'user': 'admin', 'pass': 'kh7GxR'},
    {'uuid': '5HNHTEUYUT2137Y1111A', 'user': 'admin', 'pass': 'v5DJ4I'},
    {'uuid': '4ACGZU3FNY5HZ566111A', 'user': 'admin', 'pass': 'FH2syP'},
    {'uuid': 'AL1HVCPT9G1TLYSH111A', 'user': 'admin', 'pass': 'cPy3to'},
    {'uuid': 'AL1HVCPT9G1TLYSH111A', 'user': 'admin', 'pass': 'cPy3to'},
  ];

  Map<String, dynamic>? creationParams;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   creationParams = <String, dynamic>{
    //     "uuid": "H23R9K94ZULVDVCF111A",
    //     "pass": "INcFwR",
    //     "height": 300,
    //     "width": MediaQuery.of(context).size.width
    //   };
    // });
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
