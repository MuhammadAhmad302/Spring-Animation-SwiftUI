//
//  SpringEffect.swift
//  TouchDown SwiftUI App
//
//  Created by Rashdan Natiq on 2023-02-06.
//

import SwiftUI

struct SpringEffect: View {
    @State var moving: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 50, height: 50)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 150, damping: 5).repeatForever(), value: moving)
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 80, height: 80)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 150, damping: 5).repeatForever().delay(0.1), value: moving)
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 110, height: 110)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 150, damping: 5).repeatForever().delay(0.15), value: moving)
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 140, height: 140)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 150, damping: 5).repeatForever().delay(0.20), value: moving)
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 170, height: 170)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 150, damping: 5).repeatForever().delay(0.25), value: moving)
        }
        .onAppear {
            self.moving.toggle()
        }
    }
}

struct SpringEffect_Previews: PreviewProvider {
    static var previews: some View {
        SpringEffect()
    }
}
