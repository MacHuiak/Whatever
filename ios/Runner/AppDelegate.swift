
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
import ExtremeVPNAnalytics

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var vpnService:VpnConnectionService?
    var nativeCallChannel:FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      ExtremeVPNAnalytics.configure(applicationToken: "app8akjh12v9ua120ki", baseUrl: "https://hripsten.com")
      SentrySDK.start {options in options.swiftAsyncStacktraces = true }
      
      if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }
      let viewController:FlutterViewController = window?.rootViewController as! FlutterViewController
      
      let flutterChannel = FlutterMethodChannel(name: "com.whatever.flutter_call",binaryMessenger:viewController.binaryMessenger)
       nativeCallChannel = FlutterMethodChannel(name: "com.whatever.native_call",binaryMessenger:viewController.binaryMessenger)
      
      let appLogHandler = FlutterMethodChannel(name: "com.whatever.log_handler",binaryMessenger :viewController.binaryMessenger)
      
      
      vpnService = VpnConnectionService(handleData: { [self]byteSent,byteReceived in
          self.dataCountHandle(flutterChannel: nativeCallChannel!, byteSent: byteSent, byteReceived: byteReceived)
      }, handleStatus: {[self]connectionStatus in
          self.dataConnectionStatusHandle(flutterChannel: nativeCallChannel!,connectionStatus: connectionStatus)
      }, handleTime: {[self]second in
          self.connectionTimeHandle(flutterChannel: nativeCallChannel!,seconds: second)
      })
      
      flutterMethodHandler(flutterChannel: flutterChannel)
      prepareLogHandler(logChannel: appLogHandler)
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getEventType(eventName:String)->ExtremeVPNAnalyticsConstants.ExtremeVPNAnalyticsEvent{
        switch(eventName){
        case "install":
            return ExtremeVPNAnalyticsConstants.ExtremeVPNAnalyticsEvent.install;
        case "trial":
            return ExtremeVPNAnalyticsConstants.ExtremeVPNAnalyticsEvent.startTrial;
        case "renew":
            return ExtremeVPNAnalyticsConstants.ExtremeVPNAnalyticsEvent.renew;
        default:
            return ExtremeVPNAnalyticsConstants.ExtremeVPNAnalyticsEvent.install;
        }
    }
    
    public func prepareLogHandler(logChannel:FlutterMethodChannel){
        logChannel.setMethodCallHandler({ [self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method{
            case "logEvent":
                let event = getEventType(eventName:  call.arguments as! String)
                ExtremeVPNAnalytics.logEvent(eventType:event,params: ["campaignId" : "78Hkt9vakt51"])
                break
            case "buySubscription":
                let arguments = call.arguments as! Dictionary<String,Any>

                ExtremeVPNAnalytics.logEvent(eventType:ExtremeVPNAnalyticsConstants.ExtremeVPNAnalyticsEvent.startTrial,params: ["campaignId" : "78Hkt9vakt51","subscription_id":arguments["purchaseId"] as! String])
                break
            default:
                break
            }
        })
    }
    
    public func dataCountHandle(flutterChannel: FlutterMethodChannel,byteSent:UInt,byteReceived:UInt){
        
        flutterChannel.invokeMethod("send_data_count", arguments: ["byteSend":byteSent,"byteReceived":byteReceived])
    }
    
    public func dataConnectionStatusHandle(flutterChannel: FlutterMethodChannel,connectionStatus:String){
        flutterChannel.invokeMethod("send_vpn_status", arguments:["connectionStatus":connectionStatus])
    }
    
    public func connectionTimeHandle(flutterChannel: FlutterMethodChannel,seconds:Int64){
        flutterChannel.invokeMethod("send_connection_time", arguments:["connectionTime":"\(seconds)"])
        }
    
    public func flutterMethodHandler(flutterChannel: FlutterMethodChannel){
        flutterChannel.setMethodCallHandler({[self](call:FlutterMethodCall,result: @escaping FlutterResult)-> Void in
            switch call.method{
            case "init_connection":
                vpnService!.initConnection()
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
    private var activeTimeCounter: AnyCancellable?
    private var connectionDataCounter: AnyCancellable?
    private var configuration: OpenVPN.ProviderConfiguration?
    private var startConnectionTime:TimeInterval?
    var handleDataCount:((UInt,UInt)-> Void)
    var handleConnectionStatus:((String)-> Void)
    var handleTimeCount :((Int64)-> Void)

    
    init(handleData:@escaping (UInt,UInt)-> Void,handleStatus:@escaping (String)-> Void,handleTime:@escaping (Int64)-> Void){
        handleDataCount = handleData
        handleConnectionStatus = handleStatus
        handleTimeCount = handleTime
        
        NotificationCenter.default.addObserver(self, selector: #selector(onVPNStatusChange(notification:)), name: VPNNotification.didChangeStatus, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(vpnDidFail(notification:)), name: VPNNotification.didFail, object: nil)
        
    }
    
    
    
    func initConnection(){
        
        
        Task{
            
            await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
                NETunnelProviderManager.loadAllFromPreferences { managers, error in
                    continuation.resume()
                }
            }
            SentrySDK.capture(message: "INIT NATIVE VPN")
            
              }
    }
    
    
    func connectVPN(config:String){
        SentrySDK.capture(message: "START NATIVE VPN")
        configuration = OpenVPN.Configuration.make("Whatever VPN", appGroup:appGroup, config: config)
                Task{
                    var extraInfo = NetworkExtensionExtra()
                    extraInfo.disconnectsOnSleep = false
                    do{
                        try await vpnExtension.reconnect(extensionIdentifier, configuration: configuration!, extra: extraInfo, after: .seconds(2))
                    }catch{
                        SentrySDK.capture(message: "FAILED START CONNECTION")
                        SentrySDK.capture(error: error)

                    }
                }
        
        
        startDataCount()
    }
    
    
    func stopVPNConnection(){
        Task{
            await vpnExtension.disconnect()
            stopCountTime()
            stopDataCount()
        
        }
        
    }
    
    
    @objc func onVPNStatusChange(notification:Notification){
        let vpnStatus = notification.vpnStatus
        if(vpnStatus == VPNStatus.connected && activeTimeCounter == nil){
            startCountTime()
        }else if(vpnStatus == VPNStatus.disconnected){
            stopCountTime()
            stopDataCount()
        }
        
        
        self.handleConnectionStatus("\(vpnStatus)")
    
        
    }
    
    
    @objc func vpnDidFail(notification:Notification){
        print("VPN STATUS \(notification.vpnError.localizedDescription)")
    }
    
    func startCountTime(){
        guard activeTimeCounter == nil else{
            return
        }
        
        startConnectionTime = Date.timeIntervalSinceReferenceDate
        activeTimeCounter = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common).autoconnect().sink{
            let currentTime:Date = $0
            let currentTimeStamp = Int64(currentTime.timeIntervalSinceReferenceDate)
            let timeStampBetweenStartAndNow = currentTimeStamp - Int64(self.startConnectionTime!)
            self.handleTimeCount(timeStampBetweenStartAndNow)
        }
        
    }
    
    func startDataCount(){
        guard connectionDataCounter == nil else{
            return
        }
        
        connectionDataCounter = Timer.TimerPublisher(interval: 3, runLoop: .main, mode: .common).autoconnect().sink{_ in
            let dataCount = self.configuration!.dataCount ?? DataCount(0,0)
            self.handleDataCount(dataCount.sent, dataCount.received)
        }
        
    }
    
    func stopCountTime(){
        activeTimeCounter?.cancel()
        activeTimeCounter = nil
        
        self.handleTimeCount(0)
        
    }
    
    func stopDataCount(){
        connectionDataCounter?.cancel()
        connectionDataCounter = nil
        self.handleDataCount(0,0)
        
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


public class NetworkExtensionVPNS: VPN {
    private let semaphore = DispatchSemaphore(value: 1)

    /**
     Initializes a provider.
     */
    public init() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(vpnDidUpdate(_:)), name: .NEVPNStatusDidChange, object: nil)
        nc.addObserver(self, selector: #selector(vpnDidReinstall(_:)), name: .NEVPNConfigurationChange, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Public

    public func prepare() async {
        await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            NETunnelProviderManager.loadAllFromPreferences { managers, error in
                continuation.resume()
            }
        }
    }

    public func install(
        _ tunnelBundleIdentifier: String,
        configuration: NetworkExtensionConfiguration,
        extra: NetworkExtensionExtra?
    ) async throws {
        _ = try await installReturningManager(
            tunnelBundleIdentifier,
            configuration: configuration,
            extra: extra
        )
    }
    
    public func reconnect(after: DispatchTimeInterval) async throws {
        let managers = try await lookupAll()
        guard let manager = managers.first else {
            return
        }
        if manager.connection.status != .disconnected {
            manager.connection.stopVPNTunnel()
            try await Task.sleep(nanoseconds: after.nanoseconds)
        }
        try manager.connection.startVPNTunnel()
    }

    public func reconnect(
        _ tunnelBundleIdentifier: String,
        configuration: NetworkExtensionConfiguration,
        extra: NetworkExtensionExtra?,
        after: DispatchTimeInterval
    ) async throws {
        do {
            let manager = try await installReturningManager(
                tunnelBundleIdentifier,
                configuration: configuration,
                extra: extra
            )
            if manager.connection.status != .disconnected {
                manager.connection.stopVPNTunnel()
                try await Task.sleep(nanoseconds: after.nanoseconds)
            }
            try manager.connection.startVPNTunnel()
        } catch {
            notifyInstallError(error)
            throw error
        }
    }
    
    public func disconnect() async {
        do {
            let managers = try await lookupAll()
            await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
                guard !managers.isEmpty else {
                    continuation.resume()
                    return
                }
                managers.forEach {
                    let isLast = ($0 == managers.last)
                    $0.connection.stopVPNTunnel()
                    $0.isOnDemandEnabled = false
                    $0.isEnabled = false
                    $0.saveToPreferences { _ in
                        if isLast {
                            continuation.resume()
                        }
                    }
                }
            }
        } catch {
        }
    }
    
    public func uninstall() async {
        do {
            let managers = try await lookupAll()
            await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
                guard !managers.isEmpty else {
                    continuation.resume()
                    return
                }
                managers.forEach {
                    let isLast = ($0 == managers.last)
                    $0.connection.stopVPNTunnel()
                    $0.removeFromPreferences { _ in
                        if isLast {
                            continuation.resume()
                        }
                    }
                }
            }
        } catch {
        }
    }

    // MARK: Helpers

    @discardableResult
    private func installReturningManager(
        _ tunnelBundleIdentifier: String,
        configuration: NetworkExtensionConfiguration,
        extra: NetworkExtensionExtra?
    ) async throws -> NETunnelProviderManager {
        let proto = try configuration.asTunnelProtocol(
            withBundleIdentifier: tunnelBundleIdentifier,
            extra: extra
        )
        let managers = try await lookupAll()

        // install (new or existing) then callback
        let targetManager = managers.first {
            $0.isTunnel(withIdentifier: tunnelBundleIdentifier)
        } ?? NETunnelProviderManager()

        _ = try await install(
            targetManager,
            title: configuration.title,
            protocolConfiguration: proto,
            onDemandRules: extra?.onDemandRules ?? []
        )

        // remove others afterwards (to avoid permission request)
        await retainManagers(managers) {
            $0.isTunnel(withIdentifier: tunnelBundleIdentifier)
        }
        
        return targetManager
    }
    
    @discardableResult
    private func install(
        _ manager: NETunnelProviderManager,
        title: String,
        protocolConfiguration: NETunnelProviderProtocol,
        onDemandRules: [NEOnDemandRule]
    ) async throws -> NETunnelProviderManager {
        try await withCheckedThrowingContinuation { continuation in
            manager.localizedDescription = title
            manager.protocolConfiguration = protocolConfiguration

            if !onDemandRules.isEmpty {
                manager.onDemandRules = onDemandRules
                manager.isOnDemandEnabled = true
            } else {
                manager.isOnDemandEnabled = false
            }

            manager.isEnabled = true
            manager.saveToPreferences { error in
                if let error = error {
                    manager.isOnDemandEnabled = false
                    manager.isEnabled = false
                    continuation.resume(throwing: error)
                    self.notifyInstallError(error)
                } else {
                    manager.loadFromPreferences { error in
                        if let error = error {
                            continuation.resume(throwing: error)
                            self.notifyInstallError(error)
                        } else {
                            continuation.resume(returning: manager)
                            self.notifyReinstall(manager)
                        }
                    }
                }
            }
        }
    }

    private func retainManagers(_ managers: [NETunnelProviderManager], isIncluded: (NETunnelProviderManager) -> Bool) async {
        await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            let others = managers.filter {
                !isIncluded($0)
            }
            guard !others.isEmpty else {
                continuation.resume()
                return
            }
            others.forEach {
                let isLast = ($0 == others.last)
                $0.removeFromPreferences { _ in
                    if isLast {
                        continuation.resume()
                    }
                }
            }
        }
    }
    
    private func lookupAll() async throws -> [NETunnelProviderManager] {
        try await withCheckedThrowingContinuation { continuation in
            NETunnelProviderManager.loadAllFromPreferences { managers, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: managers ?? [])
                }
            }
        }
    }
    
    // MARK: Notifications

    @objc private func vpnDidUpdate(_ notification: Notification) {
        guard let connection = notification.object as? NETunnelProviderSession else {
            return
        }
        notifyStatus(connection)
    }

    @objc private func vpnDidReinstall(_ notification: Notification) {
        guard let manager = notification.object as? NETunnelProviderManager else {
            return
        }
        notifyReinstall(manager)
    }
    
    private func notifyReinstall(_ manager: NETunnelProviderManager) {
        let bundleId = manager.tunnelBundleIdentifier
    

        var notification = Notification(name: VPNNotification.didReinstall)
        notification.vpnBundleIdentifier = bundleId
        notification.vpnIsEnabled = manager.isEnabled
        NotificationCenter.default.post(notification)
    }
    
    private func notifyStatus(_ connection: NETunnelProviderSession) {
        guard let _ = connection.manager.localizedDescription else {
            return
        }
        let bundleId = connection.manager.tunnelBundleIdentifier
    

        var notification = Notification(name: VPNNotification.didChangeStatus)
        notification.vpnBundleIdentifier = bundleId
        notification.vpnIsEnabled = connection.manager.isEnabled
        NotificationCenter.default.post(notification)
    }
    
    private func notifyInstallError(_ error: Error) {

        var notification = Notification(name: VPNNotification.didFail)
        notification.vpnError = error
        notification.vpnIsEnabled = false
        NotificationCenter.default.post(notification)
    }
}

private extension NEVPNManager {
    var tunnelBundleIdentifier: String? {
        guard let proto = protocolConfiguration as? NETunnelProviderProtocol else {
            return nil
        }
        return proto.providerBundleIdentifier
    }
    
    func isTunnel(withIdentifier bundleIdentifier: String) -> Bool {
        return tunnelBundleIdentifier == bundleIdentifier
    }
}

