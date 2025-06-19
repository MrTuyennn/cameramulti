package com.example.cameramulti

import com.example.cameramulti.module.native_view.camera_multi.CameraMultiFactory
import com.example.cameramulti.utils.AppConstant
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.platformViewsController.registry.registerViewFactory(
            AppConstant.CHANNEL_CAMERA_MULTI,
          CameraMultiFactory(flutterEngine.dartExecutor.binaryMessenger)
        )
    }
}
