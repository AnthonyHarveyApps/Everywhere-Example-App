//
//  MessagesView.swift
//  Everywhere Example App
//
//  Created by Anthony Harvey on 6/2/23.
//

import SwiftUI

struct MessagesView: View {
    @State var sosActivated: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                SOSSliderView(sosActivated: $sosActivated)
                Spacer()
            }
            if sosActivated {
                Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
                SOSAlertView(sosActivated: $sosActivated)
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
