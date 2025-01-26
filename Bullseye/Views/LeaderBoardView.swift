//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by 郑建城 on 2025/1/11.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
                            let leaderboardEntry = game.leaderboardEntries[index]
                            RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
        }
        .padding([.top, .horizontal])
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

#Preview {
    LeaderBoardView(leaderboardIsShowing: .constant(true), game: .constant(Game(loadTestData: true)))
}
