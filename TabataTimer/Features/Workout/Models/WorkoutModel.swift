//
//  WorkoutModel.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import Foundation

struct WorkoutModel: Identifiable, Decodable, Encodable {
    let id: UUID
    var preparationDuration: TimeInterval
    var exerciseDuration: TimeInterval
    var restDuration: TimeInterval
    var round: Int
    var cycle: Int
    var restCycle: TimeInterval
}
