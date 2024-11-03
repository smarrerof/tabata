//
//  BaseCounterButton.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 29/10/24.
//

import SwiftUI

import SwiftUI

struct BaseCounterButton: View {
    @Binding var value: Int
    let title: String
    var minValue: Int
    var step: Int
    var format: (Int) -> String
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.title3)
                .foregroundColor(.white)
            
            HStack {
                CircleButton(width: 28, color: .purple, iconName: "minus") {
                    if value > minValue {
                        value -= step
                    }
                }
                
                Text(format(value))
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                
                CircleButton(width: 28, color: .purple, iconName: "plus") {
                    value += step
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.indigo)
            .cornerRadius(12)
    }
}

#Preview {
    var value = 5;
    
    func format(value: Int) -> String {
            return String(value)
        }
    
    return BaseCounterButton(value: .constant(value), title: "Rounds", minValue: 1, step: 5, format: format);
}
