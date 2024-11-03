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
                NumberCounterButton(value: $rounds, title: "Rounds")
                    .frame(maxHeight: maxHeight)
                NumberCounterButton(value: $exercises, title: "Exercises")
                    .frame(maxHeight: maxHeight)
                HStack {
                    TimerCounterButton(value: $work, title: "Work")
                    TimerCounterButton(value: $rest, title: "Rest")
                }.frame(maxHeight: maxHeight)
                Spacer()
                NavigationLink(destination: { EmptyView() }) {
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
