//
//  NumberCounterButton.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 29/10/24.
//

import SwiftUI

struct NumberCounterButton: View {
    @Binding var value: Int
    let color: Color
    let title: String
    var minValue: Int = 1
    var step: Int = 1
    
    var body: some View {
        BaseCounterButton(value: $value, color: color, title: title, minValue: minValue, step: step, format: formatNumber)
    }
    
    private func formatNumber(value: Int) -> String {
        return String(value)
    }
}

#Preview {
    NumberCounterButton(value: .constant(3), color: Color(AppColor.green.rawValue), title: "Rounds")
}
