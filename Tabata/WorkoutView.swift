//
//  WorkoutView.swift
//  Tabata
//
//  Created by Sergio Marrero Fernandez on 12/11/24.
//

import SwiftUI

struct WorkoutView: View {
    var workout: Workout
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WorkoutView(workout: Workout(warmUp: 30, rounds: 3, exercises: 6, work: 40, rest: 20, coolDown: 30))
}
