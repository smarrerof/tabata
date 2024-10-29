//
//  TimerCounterButton.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 28/10/24.
//

import SwiftUI

struct TimerCounterButton: View {
    @Binding var value: Int
    let title: String
    var minValue: Int = 5
    var step: Int = 5
    
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
        let minutes = value / 60
        let seconds = value % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerCounterButton(value: .constant(40), title: "Work")
}
