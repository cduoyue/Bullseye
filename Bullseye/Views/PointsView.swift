//
//  PointsView.swift
//  Bullseye
//
//  Created by 郑建城 on 2025/1/10.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is".uppercased())
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points \n🎉🎉🎉")
            Button {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                ButtonText(text: "Start New Round")
            }
            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview {
    PointsView(alertIsVisible: .constant(true), sliderValue: .constant(50.0), game: .constant(Game()))
}
