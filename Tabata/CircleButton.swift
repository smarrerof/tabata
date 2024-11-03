//
//  CircleButton.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 3/11/24.
//

import SwiftUI

struct CircleButton: View {
    var width: CGFloat
    var color: Color
    var iconName: String
    var disabled: Bool = false
    var action: () -> Void
        
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: width)
                    .foregroundColor(color)
                    .opacity(disabled ? 0.4 : 1)
                Image(systemName: iconName)
                    .scaledToFit()
                    .foregroundColor(.white)
            }
        }.disabled(disabled)
    }
}

#Preview {
    HStack() {
        CircleButton(width: 28, color: .purple, iconName: "plus") { }
        CircleButton(width: 28, color: .purple, iconName: "plus", disabled: true) { }
    }
}
