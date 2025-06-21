package com.example.cameramulti.module.native_view.camera_multi

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.LinearLayout
import android.widget.RelativeLayout
import com.tutk.IOTC.AVAPIs
import com.tutk.IOTC.IOTCAPIs
import com.tutk.IOTC.TUTKGlobalAPIs
import com.xc.p2pVideo.NativeMediaPlayer
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView


@SuppressLint("SetJavaScriptEnabled")
class CameraMultiWidget internal constructor(
    context: Context,
    id: Int,
    messenger: BinaryMessenger,
    args: Any?): PlatformView,MethodCallHandler {

    private var devices: List<Map<String, String>>
    private var playerRoot: LinearLayout? = null

   init {
       val creationParams = args as Map<*, *>?

       devices = (creationParams?.get("cameraMulti") as? List<*>)?.mapNotNull { item ->
           (item as? Map<*, *>)?.mapNotNull { (k, v) ->
               if (k is String && v is String) k to v else null
           }?.toMap()
       } ?: emptyList()

      // initView(context)
       initConfig()
   }

    private fun initConfig() {
        var ret: Int = TUTKGlobalAPIs.TUTK_SDK_Set_License_Key("AQAAAMHY3vUDYAhbA/F5ekE+00jq1ACuTIznLJDK55p/jpI7riWN6bp7KYLTDrsQ3XJkzsVkJSBK3rmD3ZPAWF4JlZzn3J/qpmA3O31yfX7VxVNDXd1h3vJYFtgsjOcl9vn4c4k2oPKXHUGjtGxH3O+4Wc14AI/mkmvJIFVI2k3M2J9eanoTqXbEhLMRRpXa+tmbCzM4/L/q3NMZqc4sdErADNIb")
        if (ret != TUTKGlobalAPIs.TUTK_ER_NoERROR) return
        ret = IOTCAPIs.IOTC_Initialize2(0)
        if (ret != IOTCAPIs.IOTC_ER_NoERROR) return
        AVAPIs.avInitialize(32)
        NativeMediaPlayer.JniInitClassToJni()
    }

    private fun initView(context : Context) {
        val metrics = context.resources.displayMetrics
        val width = metrics.widthPixels
        val height = (width * 9) / 16
        val widthMini = width / 2
        val heightMini = (widthMini * 9) / 16
        val density = metrics.density.toInt()

        playerRoot =  LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT
            )
        }

        var rowLayout: LinearLayout? = null

        devices.forEachIndexed { index, _ ->
            val box = RelativeLayout(context).apply {
                layoutParams = RelativeLayout.LayoutParams(widthMini, heightMini).apply {
                    if (index % 2 == 0) marginEnd = 1 else marginStart = 1
                    setMargins(0, 0, 0, 45 * density)
                }
            }

            val innerBox = LinearLayout(context).apply {
                setBackgroundColor(Color.RED)
                layoutParams = RelativeLayout.LayoutParams(
                    RelativeLayout.LayoutParams.MATCH_PARENT,
                    RelativeLayout.LayoutParams.MATCH_PARENT
                ).apply {
                    addRule(RelativeLayout.CENTER_IN_PARENT)
                }
            }

            box.addView(innerBox)

            if (index % 2 == 0) {
                rowLayout = LinearLayout(context).apply {
                    orientation = LinearLayout.HORIZONTAL
                    layoutParams = LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT
                    )
                }
            }

            rowLayout?.addView(box)

            if (index % 2 != 0 || index == devices.size - 1) {
                playerRoot?.addView(rowLayout)
            }
        }

    }

    override fun getView(): View? {
        return playerRoot!!
    }

    override fun dispose() {

    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

    }
}