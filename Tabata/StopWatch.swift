//
//  Timer.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 2/11/24.
//

import SwiftUI

struct StopWatch: View {
    let backgroundColor: Color
    let totalTime: Int
    let labelText: String
    
    @State var remainingTime: Int
    @State var progress: CGFloat = 1.0
    @State var timer: Timer?
    
    @State var pauseDisabled = false
    @State var playDisabled = true
    
    
    init(backgroundColor: Color, totalTime: Int, labelText: String) {
        self.backgroundColor = backgroundColor
        self.totalTime = totalTime
        self.labelText = labelText
        
        remainingTime = totalTime
        progress = 0
    }

    var body: some View {
        HStack {
            WorkoutCard(title: "Round", current: 1, total: 3)
            WorkoutCard(title: "Exercise", current: 2, total: 6)
        }
            .frame(height: 100)
            .padding(16)
        
        ZStack {
            Circle()
                .stroke(backgroundColor.opacity(0.2), lineWidth: 20)
                    
            Circle()
                .trim(from: 0, to: 1 - progress)
                //.stroke(backgroundColor, lineWidth: 20)
                .stroke(backgroundColor, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack {
                Text(labelText)
                    .font(.title2)
                
                Text("\(remainingTime)")
                    .font(.title)
                    .bold()
            }
        }
            .padding(32)
            .onAppear(perform: start)
        
        HStack {
            CircleButton(width: 64, color: .red, iconName: "pause.fill", disabled: pauseDisabled) {
                pauseDisabled = true
                stop()
                playDisabled = false
            }
            CircleButton(width: 64, color: .red, iconName: "play.fill", disabled: playDisabled) {
                pauseDisabled = false
                start()
                playDisabled = true
            }
        }
    }
    
    private func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
                progress = CGFloat(remainingTime) / CGFloat(totalTime)
            } else {
                pauseDisabled = true
                stop()
            }
        }
    }
    
    private func stop() {
        timer?.invalidate()
        timer = nil
    }
}

struct WorkoutCard: View {
    var title: String
    var current: Int
    var total: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Text("\(current) / \(total)")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .cornerRadius(12)
    }
}

#Preview {
    StopWatch(backgroundColor: .red, totalTime: 40, labelText: "Work")
}
