import 'package:cameramulti/components/joy_stick.dart';
import 'package:cameramulti/screens/camera_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraJoyStick extends StatefulWidget {
  const CameraJoyStick({super.key});

  @override
  State<CameraJoyStick> createState() => _CameraJoyStickState();
}

class _CameraJoyStickState extends State<CameraJoyStick> {
  MethodChannel? channelPlayer;

  @override
  void initState() {
    super.initState();
    channelPlayer = const MethodChannel('channelCameraPlayer');
    channelPlayer?.invokeMethod('methodCamera', {
      'uuid': "82TZ1VPJMDRLS3Z4111A",
      'pass': "ZRFFHp",
    });
  }

  void callback(x, y) {
    print('callback x => $x and y $y');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Expanded(
            child: CameraPlayer(),
          ),
          JoyStick(
            radius: 100.0,
            stickRadius: 20,
            callback: callback,
            onPtzChanged: (value) {
              print('onPtzChanged value => $value');
              channelPlayer?.invokeMethod('methodPtz', value);
            },
          )
        ],
      ),
    );
  }
}
