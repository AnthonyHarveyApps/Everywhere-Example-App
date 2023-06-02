//
//  SOSAlertView.swift
//  Everywhere Example App
//
//  Created by Anthony Harvey on 6/2/23.
//

import SwiftUI

struct SOSAlertView: View {
    @Binding var sosActivated: Bool
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                sosRedTopWithCircle
                bottomWarningWithButtons
            }
        }
        .frame(width: screenWidth - 40, height: 380)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
    func fullSOSActivation() {
        //
    }
}

struct SOSAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SOSAlertView(sosActivated: .constant(true))
    }
}

extension SOSAlertView {
    @ViewBuilder var sosRedTopWithCircle: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
            ZStack {
                Circle()
                    .fill(.red)
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
                Text(Constants.sos)
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
            }
            .offset(y: 40)
        }
        .zIndex(1)
        .frame(height: 80)
    }
    
    @ViewBuilder var bottomWarningWithButtons: some View {
        Rectangle()
            .foregroundColor(.white)
            .overlay {
                VStack {
                    Text(Constants.activate)
                        .font(.title)
                        .bold()
                    Text(Constants.warning)
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack {
                        cancelButton
                        activateButton
                    }
                    .padding()
                }
                .padding(.top, 40)
                .foregroundColor(.black)
            }
    }
    
    @ViewBuilder var activateButton: some View {
        Button {
            fullSOSActivation()
        } label: {
            Text(Constants.activateSOS)
                .underline()
                .bold()
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
            
                .background(Rectangle().foregroundColor(.orange))
                .padding()
        }
    }
    
    @ViewBuilder var cancelButton: some View {
        Button {
            sosActivated = false
        } label: {
            Text(Constants.cancel)
                .underline()
                .foregroundColor(.orange)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Rectangle().stroke().foregroundColor(.orange))
                .padding()
        }
        .frame(maxWidth: .infinity)
    }
}
