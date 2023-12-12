//
//  PacketTunnelProvider.swift
//  OpenVPNExtension
//
//  Created by ORCA on 07.12.2023.
//

import NetworkExtension
import TunnelKitOpenVPNAppExtension


class PacketTunnelProvider: OpenVPNTunnelProvider {

    override func startTunnel(options: [String : NSObject]? = nil) async throws {
        dataCountInterval = 3
        dnsTimeout = 5000
        logSeparator = "--- EOF ---"
        dataCountInterval = 5000
        try await super.startTunnel(options: options)
    }
}
