//
//  CameraMultiWidget.swift
//  Runner
//
//  Created by JunCook on 21/7/25.
//

import Flutter
import UIKit

class CameraMultiWidget: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
        let params = args as? Dictionary<String, Any>
        let uuid = params?["uuid"] as? String ?? ""
        let pass = params?["pass"] as? String ?? ""
        let width = (params?["width"] as? CGFloat) ?? frame.width
        let height = (params?["height"] as? CGFloat) ?? frame.height

        let widget = CameraMultiView(uuid: uuid, pass: pass, width: width, height: height)
        self._view = widget ?? UIView()

        super.init()
    }

    func view() -> UIView {
        return _view
    }
}
