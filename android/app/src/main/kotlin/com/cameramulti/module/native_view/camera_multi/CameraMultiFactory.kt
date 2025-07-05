package com.example.cameramulti.module.native_view.camera_multi

import android.app.Activity
import android.content.Context
import com.cameramulti.module.native_view.camera_multi.CameraMultiWidget
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class CameraMultiFactory(private val messenger: BinaryMessenger,  private val activity: Activity): PlatformViewFactory (
    StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
       return CameraMultiWidget(context, activity, viewId , messenger, args)
    }
}