//
//  SpringLoader.swift
//  TouchDown SwiftUI App
//
//  Created by Rashdan Natiq on 2023-02-11.
//

import SwiftUI

struct SpringLoader: View {

    @Environment(\.colorScheme) var scheme
    @State var rotateBall: Bool = false
    @State var showPopUP: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Button {
                    withAnimation(.spring()) {
                        showPopUP.toggle()
                    }
                } label: {
                    Text("show popup".uppercased())
                        .foregroundColor(scheme == .dark ? Color.white : Color.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(scheme == .dark ? Color.black : Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.primary.opacity(0.07), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.primary.opacity(0.07), radius: 5, x: -5, y: -5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay (
                ZStack {
                    if showPopUP {
                        Color.primary.opacity(0.2)
                            .ignoresSafeArea()
                    }
                    animationView(showPopup: $showPopUP, rotateBall: $rotateBall)
                        .offset(y: showPopUP ? 0 : UIScreen.main.bounds.height)
                }
            )
        }
        .onTapGesture {
            withAnimation(.spring()) {
                showPopUP.toggle()
            }
        }
    }
}

struct animationView: View {

    @Environment(\.colorScheme) var scheme
    @Binding var showPopup: Bool
    @Binding var rotateBall: Bool

    @State var animateBall: Bool = false
    @State var animateRotation: Bool = false

    var body: some View {
        ZStack {
            (scheme == .dark ? Color.black : Color.white)
                .frame(width: 220, height: 220)
                .cornerRadius(14)
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: 5, y: 5)
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: -5, y: -5)
            HStack {
                VStack(spacing: 0) {
                    Circle()
                        .fill(Gradient(colors: darkLoaderColor))
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rotateBall && animateRotation ? 360 : 0 ))
                        .offset(y: animateBall ? 0 : -60)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(), value: animateBall)

                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 40, height: 40)
                        .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0.0))
                        .offset(y: 30)
                        .opacity(animateBall ? 1 : 0)
                }
                VStack(spacing: 0) {
                    Circle()
                        .fill(Gradient(colors: darkLoaderColor))
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rotateBall && animateRotation ? 360 : 0 ))
                        .offset(y: animateBall ? 0 : -60)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.2), value: animateBall)

                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 40, height: 40)
                        .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0.0))
                        .offset(y: 30)
                        .opacity(animateBall ? 1 : 0)
                }
                VStack(spacing: 0) {
                    Circle()
                        .fill(Gradient(colors: darkLoaderColor))
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rotateBall && animateRotation ? 360 : 0 ))
                        .offset(y: animateBall ? 0 : -60)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3), value: animateBall)

                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 40, height: 40)
                        .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0.0))
                        .offset(y: 30)
                        .opacity(animateBall ? 1 : 0)
                }
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.5)) {
                animateBall = true
            }
            withAnimation(Animation.linear(duration: 0.6).repeatForever(autoreverses: true)) {
                animateRotation = true
            }
        }
    }
}

struct SpringLoader_Previews: PreviewProvider {
    static var previews: some View {
        SpringLoader()
    }
}
