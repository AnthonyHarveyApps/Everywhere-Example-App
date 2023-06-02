//
//  Constants.swift
//  Everywhere Example App
//
//  Created by Anthony Harvey on 6/2/23.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let screenSize = UIScreen.main.bounds.size

enum Constants {
    ///MainTabView
    static let messages = "Messages"
    static let messagesSymbolName = "ellipsis.message.fill"
    static let maps = "Maps"
    static let mapSymbolName = "map"
    static let checkin = "Check-in"
    static let checkinSymbolName = "checkmark.circle"
    static let feed = "Feed"
    static let feedSymbolName = "newspaper"
    static let settings = "Settings"
    static let settingsSymbolName = "gear"
    static let connected = "Connected"
    static let connectedSymbolName = "phone.connection"
    static let data = "Data"
    static let dataSymbolName = "chart.bar"
    static let trackingOn = "Tracking On"
    static let trackingSymbolName = "circle.dotted"
    static let globeSymbolName = "globe"
    static let bellSymbolName = "bell.fill"
    
    /// SOSAlertView
    static let activate = "ACTIVATE"
    static let warning = "You are about to activate SOS.\nEmergency responders will be contacted."
    static let cancel = "Cancel"
    static let activateSOS = "Activate SOS"
    static let sos = "SOS"
    
    /// SOSSliderView
    static let slideToActivate = "slide to activate"
    static let sosActive = "SOS ACTIVE"
    static let warningSymbolName = "exclamationmark.triangle"
    static let redCircleHeight: CGFloat = 98
}
