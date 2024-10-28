//
//  WorkoutFormViewModel.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 25/10/2024.
//

import Foundation
import SwiftUI

class WorkoutFormViewModel: ObservableObject {
    
    @Environment(\.dismiss) private var dismiss
    
    @Published var preparationDuration: Int = 0
    @Published var exerciseDuration: Int = 0
    @Published var restDuration: Int = 0
    @Published var round: Int = 0
    @Published var cycle: Int = 0
    @Published var restCycle: Int = 0
    
    public func saveWorkoutSettings() {
        print("WorkoutFormViewModel :: => saveWorkoutSettings()")
        printAllValues()
    }
    
    // Add this new function to print all values
    private func printAllValues() {
        print("""
            ---- Workout Settings ----
            Preparation Duration: \(preparationDuration)
            Exercise Duration: \(exerciseDuration)
            Rest Duration: \(restDuration)
            Round: \(round)
            Cycle: \(cycle)
            Rest Cycle: \(restCycle)
            ----------------------
            """)
    }
    
    
}
