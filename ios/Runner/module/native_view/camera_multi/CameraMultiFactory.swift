//
//  CameraMultiFactory.swift
//  Runner
//
//  Created by JunCook on 21/7/25.
//

import Foundation
import Flutter
import UIKit


class CameraMultiFactory:NSObject, FlutterPlatformViewFactory{
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return CameraMultiWidget(
            frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger
        )
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}

