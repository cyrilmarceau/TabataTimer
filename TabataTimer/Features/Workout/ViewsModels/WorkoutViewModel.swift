//
//  WorkoutViewModel.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    enum TimerState {
        case active
        case resumed
        case paused
        case cancelled
    }
    
    @Published var workout: WorkoutModel = WorkoutModel(
        id: UUID(),
        preparationDuration: 20.0,
        exerciseDuration: 30.0,
        restDuration: 15.0,
        round: 4,
        cycle: 4,
        restCycle: 90.0
    )
    
    private var timer: Timer = Timer()
    @Published var progress: Float = 0.0
    @Published var secondsToCompletion: TimeInterval = 0
    @Published var state: TimerState = .cancelled {
        didSet {
            switch state {
            case .active:
                print("didSet => active")
            case .resumed:
                print("didSet => resumed")
            case .paused:
                print("didSet => paused")
            case .cancelled:
                print("didSet => cancelled")
            }
        }
    }
    
    private func startTimer() {
        
    }
}
