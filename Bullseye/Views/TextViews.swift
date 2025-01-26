//
//  TextViews.swift
//  Bullseye
//
//  Created by 郑建城 on 2025/1/7.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
            .font(.largeTitle)
            .kerning(-1)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(1.5)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .bold()
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accent
            )
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}

#Preview {
    VStack {
        InstructionText(text: "Instruction")
        BigNumberText(text: "50")
        SliderLabelText(text: "1")
        LabelText(text: "Score")
        BodyText(text: "You scored 200 points \n🎉🎉🎉")
        ButtonText(text: "Start New Round")
        ScoreText(score: 876)
        DateText(date: Date())
        BigBoldText(text: "Leaderboard")
    }
    .padding()
}


