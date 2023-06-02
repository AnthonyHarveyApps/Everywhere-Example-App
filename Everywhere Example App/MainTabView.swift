//
//  MainTabView.swift
//  Everywhere Example App
//
//  Created by Anthony Harvey on 6/2/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                topButtonsAndHeadline
                statusIndicators
                TabView {
                    MessagesView()
                        .tabItem {
                            tabButton(
                                title: Constants.messages,
                                symbolName: Constants.messagesSymbolName)
                        }
                    MapsView()
                        .tabItem {
                            tabButton(
                                title: Constants.maps,
                                symbolName: Constants.mapSymbolName)
                        }
                    CheckinView()
                        .tabItem {
                            tabButton(
                                title: Constants.checkin,
                                symbolName: Constants.checkinSymbolName)
                        }
                    FeedView()
                        .tabItem {
                            tabButton(
                                title: Constants.feed,
                                symbolName: Constants.feedSymbolName)
                        }
                    SettingsView()
                        .tabItem {
                            tabButton(
                                title: Constants.settings,
                                symbolName: Constants.settingsSymbolName)
                        }
                }
                .tint(.primary)
                .accentColor(.white)
                .onAppear {
                    UITabBar.appearance().backgroundColor = .orange
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
    @ViewBuilder var topButtonsAndHeadline: some View {
        HStack {
            Image(systemName: Constants.globeSymbolName)
                .font(.largeTitle)
            Spacer()
            Text(Constants.messages)
                .font(.title)
            Spacer()
            Image(systemName: Constants.bellSymbolName)
                .font(.largeTitle)
        }
        .foregroundColor(.white)
        .padding()
        .padding(.top, 40)
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

extension MainTabView {
    @ViewBuilder var statusIndicators: some View {
        HStack {
            statusLabel(title: Constants.connected, symbolName: Constants.connectedSymbolName)
            Spacer()
            statusLabel(title: Constants.data, symbolName: Constants.dataSymbolName)
            Spacer()
            statusLabel(title: Constants.trackingOn, symbolName: Constants.trackingSymbolName)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
    
    @ViewBuilder func tabButton(title: String, symbolName: String) -> some View {
        VStack {
            Image(systemName: symbolName)
            Text(title)
        }
    }
    
    @ViewBuilder func statusLabel(title: String, symbolName: String) -> some View {
        HStack {
            Image(systemName: symbolName)
                .foregroundColor(.orange)
            Text(title)
        }
    }
}
