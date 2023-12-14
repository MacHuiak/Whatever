
import UIKit
import Flutter
import Foundation
import Security
import Combine
import TunnelKitCore
import TunnelKitManager
import TunnelKitOpenVPN
import NetworkExtension
import Sentry

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var vpnService:VpnConnectionService?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
     
      SentrySDK.start {options in options.swiftAsyncStacktraces = true }
      
      if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }
      let viewController:FlutterViewController = window?.rootViewController as! FlutterViewController
      
      vpnService = VpnConnectionService()
      let flutterChannel = FlutterMethodChannel(name: "com.whatever.flutter_call",binaryMessenger:viewController.binaryMessenger)
      flutterMethodHandler(flutterChannel: flutterChannel)
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    public func flutterMethodHandler(flutterChannel: FlutterMethodChannel){
        flutterChannel.setMethodCallHandler({[self](call:FlutterMethodCall,result: @escaping FlutterResult)-> Void in
            switch call.method{
            case "init_connection":
                vpnService?.initConnection()
                break
            case "start_vpn":
                let arguments = call.arguments as? Dictionary<String,Any>
                let config = arguments!["vpn_config"] as! String
                vpnService?.connectVPN(config: config)
                break
            case "stop_vpn":
                vpnService?.stopVPNConnection()
                break
            default:
                break
            }
            
        
        })
    }
}


private let appGroup = "group.com.what.ever.vpn"

private let extensionIdentifier = "com.what.ever.vpn.OpenVPNExtension"

private let title = "WhateverVPN"


class VpnConnectionService{
    private let vpnExtension = NetworkExtensionVPN()
    
    
    func initConnection(){
        
        
        Task{
            
        
                await vpnExtension.prepare()
            SentrySDK.capture(message: "INIT NATIVE VPN")
            
              }
    }
    
    
    func connectVPN(config:String){
        SentrySDK.capture(message: "START NATIVE VPN")
        let vpnConfig = OpenVPN.Configuration.make("Whatever VPN", appGroup:appGroup, config: config)
                Task{
                    var extraInfo = NetworkExtensionExtra()
                    extraInfo.disconnectsOnSleep = false
                    do{
                        try await vpnExtension.reconnect(extensionIdentifier, configuration: vpnConfig, extra: extraInfo, after: .seconds(2))
                    }catch{
                        SentrySDK.capture(message: "FAILED START CONNECTION")
                        SentrySDK.capture(error: error)

                    }
                }

        
    }
    
    func stopVPNConnection(){
        Task{
            await vpnExtension.disconnect()
        }
        
    }
    
}


extension OpenVPN{
    struct Configuration{
        
        static func make(_ title:String,appGroup:String,config:String)->OpenVPN.ProviderConfiguration{
            return parseConfig(title: title, appGroup: appGroup, config: config)!
        }
        
    }
    
    static func parseConfig(title:String,appGroup:String,config:String)->OpenVPN.ProviderConfiguration?{
        
        do{
            let parsedConfig = try OpenVPN.ConfigurationParser.parsed(fromContents: config)
            
            return OpenVPN.ProviderConfiguration.init(title, appGroup: appGroup, configuration: parsedConfig.configuration)
        }catch{
            print(error)
            SentrySDK.capture(message: "FAILED PARSE CONFIG")
            SentrySDK.capture(error: error)
        }
        
        return nil
        
    }
    
}
