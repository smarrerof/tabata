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
    let color: Color
    let title: String
    var minValue: Int
    var step: Int
    var format: (Int) -> String
    
    func action() -> Void {
        // Do some actions
    }
    
    func buildButton(systemName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .frame(width: 48)
                    .foregroundColor(.white)
                    .opacity(0.25)
                
                Image(systemName: systemName)
                    .font(.system(size: 24, weight: .bold))
                    .scaledToFit()
                    .foregroundColor(.white)
            }
        }
    }
    
    var body: some View {        
        VStack {
            HStack() {
                buildButton(systemName: "minus") {
                    if value > minValue {
                        value -= step
                    }
                }.padding()
                                
                VStack() {
                    Text(title)
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text(format(value))
                        .bold()
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                buildButton(systemName: "plus") {
                    value += step
                }.padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [color, color.opacity(0.75)]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(12)
        }
    }
}

#Preview {
    var value = 5;
    
    func format(value: Int) -> String {
        return String(value)
    }
    
    return BaseCounterButton(value: .constant(value), color: Color(AppColor.red.rawValue), title: "Rounds", minValue: 1, step: 5, format: format);
}
