//
//  WorkoutModel.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import Foundation

struct WorkoutModel: Identifiable {
    let id: UUID
    var preparationDuration: Date
    var workoutDuration: Date
    var restDuration: Date
    var round: Int
    var cycle: Int
    var restCycle: Int
}
