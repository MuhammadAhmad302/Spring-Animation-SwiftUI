//
//  ShimmerEffect.swift
//  TouchDown SwiftUI App
//
//  Created by Rashdan Natiq on 2023-02-19.
//

import SwiftUI

struct ShimmerEffect: View {
    var body: some View {
        VStack(spacing: 25) {
            ShimmerText(text: "AHMAD")
            ShimmerText(text: "SAGHEER")
        }
        .preferredColorScheme(.dark)
    }
}


struct ShimmerText: View {

    @Environment(\.colorScheme) var scheme

    @State var text: String
    @State var animation = false

    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 75, weight: .bold))
                .foregroundColor(scheme == .dark ?  Color.white.opacity(0.25) : Color.black.opacity(0.25))

            HStack(spacing: 0) {
                ForEach(0..<text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 75, weight: .bold))
                        .foregroundColor(rendomColor())
                }

            }
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5), Color.white, Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    animation.toggle()
                }
            }
        }
    }

    func rendomColor() -> Color {
        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return Color(color)
    }
}


struct ShimmerEffect_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffect()
    }
}
