//
//  TimerCounterButton.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 28/10/24.
//

import SwiftUI

struct TimerCounterButton: View {
    @Binding var value: Int
    let color: Color
    let title: String
    var minValue: Int = 5
    var step: Int = 5
    
    var body: some View {
        BaseCounterButton(value: $value, color: color, title: title, minValue: minValue, step: step, format: formatTime)
    }
    
    private func formatTime(value: Int) -> String {
        let minutes = value / 60
        let seconds = value % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerCounterButton(value: .constant(40), color: Color(AppColor.green.rawValue), title: "Work")
}
