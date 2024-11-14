//
//  ContentView.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 28/10/24.
//

import SwiftUI

struct HomeView: View {
    @State var rounds: Int = 3
    @State var exercises: Int = 6
    @State var work: Int = 90
    @State var rest: Int = 30
    
    let maxHeight: CGFloat? = 120
    
    var body: some View {
        NavigationStack {
            VStack {
                NumberCounterButton(value: $rounds, 
                                    color: Color(AppColor.cyan.rawValue),
                                    title: "Rounds")
                    .frame(maxHeight: maxHeight)
                NumberCounterButton(value: $exercises,
                                    color: Color(AppColor.cyan.rawValue),
                                    title: "Exercises")
                    .frame(maxHeight: maxHeight)
                TimerCounterButton(value: $work,
                                   color: Color(AppColor.green.rawValue),
                                   title: "Work")
                    .frame(maxHeight: maxHeight)
                TimerCounterButton(value: $rest,
                                   color: Color(AppColor.red.rawValue),
                                   title: "Rest")
                    .frame(maxHeight: maxHeight)
                Spacer()
                NavigationLink(destination: { WorkoutView(workout: Workout(warmUp: 30, rounds: rounds,exercises: exercises, work: work, rest: rest, coolDown: 30))
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.indigo)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
