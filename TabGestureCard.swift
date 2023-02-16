//
//  TabGestureCard.swift
//  TouchDown SwiftUI App
//
//  Created by Rashdan Natiq on 2023-01-31.
//

import SwiftUI

struct TabGestureCard: View {

    @State private var cardPosition = CGSize.zero

    var body: some View {
        CardView
            .offset(x: cardPosition.width, y: cardPosition.height)
            .rotationEffect(.degrees(Double(cardPosition.width * 0.03)))
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.cardPosition.width = self.cardPosition.width == 0 ? 190 : 0
                        }
                    }
            )
    }

    var CardView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .frame(width: 220, height: 150)
    }
}

struct TabGestureCard_Previews: PreviewProvider {
    static var previews: some View {
        TabGestureCard()
    }
}
