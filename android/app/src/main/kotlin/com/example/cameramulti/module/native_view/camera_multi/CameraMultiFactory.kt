package com.example.cameramulti.module.native_view.camera_multi

import android.content.Context
import com.example.cameramulti.MainActivity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class CameraMultiFactory(private val messenger: BinaryMessenger): PlatformViewFactory (
    StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
       return CameraMultiWidget(context, viewId , messenger, args)
    }
}