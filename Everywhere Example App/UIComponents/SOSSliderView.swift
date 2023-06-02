//
//  SOSSliderView.swift
//  Everywhere Example App
//
//  Created by Anthony Harvey on 6/2/23.
//

import SwiftUI

struct SOSSliderView: View {
    @State var amountOfCircleSlide: CGFloat = 0
    @Binding var sosActivated: Bool

    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.gray.opacity(0.2))
            ZStack(alignment: .center) {
                Capsule(style: .circular)
                    .foregroundColor(.white)
                Text(Constants.slideToActivate)
                    .foregroundColor(.black.opacity(0.8))
                HStack(spacing: 0) {
                    redExpandableCircle
                    Spacer()
                }.padding(4)
                if sosActivated {
                    activatedLabel
                }
            }.padding(10)
        }.frame(width: screenWidth, height: 120)
            .onChange(of: sosActivated) { newValue in
                if !newValue {
                    withAnimation {
                        amountOfCircleSlide = 0
                    }
                }
            }
    }
    
    func handleEndOfSlide(value: _ChangedGesture<DragGesture>.Value) {
        let totalSliderWidth = screenWidth - 24
        let threshold: CGFloat = totalSliderWidth - Constants.redCircleHeight
        if value.translation.width >= threshold {
            amountOfCircleSlide = totalSliderWidth - Constants.redCircleHeight
            sosCalled()
        } else {
            withAnimation(.spring()) {
                amountOfCircleSlide = 0
                cancel()
            }
        }
    }
    
    func handleChangeOfSlide(value: _ChangedGesture<DragGesture>.Value) {
        let dragAmount = value.translation.width
        let totalSliderWidth = screenWidth - 24
        let threshold: CGFloat = totalSliderWidth - Constants.redCircleHeight
        if dragAmount > 0 && dragAmount <= threshold {
            amountOfCircleSlide = dragAmount
        }
    }
    
    func sosCalled() {
        sosActivated = true
    }
    
    func cancel() {
        sosActivated = false
        amountOfCircleSlide = 0
    }
}

struct SOSSliderView_Previews: PreviewProvider {
    static var previews: some View {
        SOSSliderView(sosActivated: .constant(false))
    }
}

extension SOSSliderView {
    @ViewBuilder var redExpandableCircle: some View {
        ZStack {
            Capsule().foregroundColor(.red)
                .frame(width: Constants.redCircleHeight + amountOfCircleSlide, height: Constants.redCircleHeight)
            if !sosActivated {
                Text(Constants.sos)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    handleChangeOfSlide(value: value)
                }
                .onEnded { value in
                    handleEndOfSlide(value: value)
                }
        )
    }
    
    @ViewBuilder var activatedLabel: some View {
        HStack {
            Image(systemName: Constants.warningSymbolName)
            Text(Constants.sosActive)
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .bold()
        .padding()
    }
}
