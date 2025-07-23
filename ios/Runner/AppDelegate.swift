import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      weak var regischannelCameraMulti = self.registrar(forPlugin: "channelCameraMulti")

      let factoryBroadcast = CameraMultiFactory(
          messenger: regischannelCameraMulti!.messenger())
      self.registrar(forPlugin: "_channelCameraMulti")!.register(
        factoryBroadcast, withId: AppConstanst.CHANNEL_CAMERA_MULTI)
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      
  }
}
