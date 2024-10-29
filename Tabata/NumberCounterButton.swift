//
//  NumberCounterButton.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 29/10/24.
//

import SwiftUI

struct NumberCounterButton: View {
    @Binding var value: Int
    let title: String
    var minValue: Int = 1
    var step: Int = 1
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.title3)
                .foregroundColor(.white)
            
            HStack {
                Button(action: {
                    if (value > minValue) {
                        value -= step
                    }
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 28)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .scaledToFit()
                            .foregroundColor(.white)
                    }
                }
                Text("\(formatTime(value: value))")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                Button(action: {
                    value += step
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 28)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .scaledToFit()
                            .foregroundColor(.white)
                    }
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
        .cornerRadius(12)
    }
    
    func formatTime(value: Int) -> String {
        return String(value)
    }
}

#Preview {
    NumberCounterButton(value: .constant(3), title: "Rounds")
}
