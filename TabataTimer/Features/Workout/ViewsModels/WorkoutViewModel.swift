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
        preparationDuration: 5.0,
        exerciseDuration: 10.0,
        restDuration: 5.0,
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
                
                progress = 1.0
                secondsToCompletion = workout.preparationDuration
                
                startTimer()
            case .resumed:
                print("didSet => resumed")
                startTimer()
            case .paused:
                print("didSet => paused")
                timer.invalidate()
                
            case .cancelled:
                print("didSet => cancelled")
                timer.invalidate()
                progress = 0.0
                secondsToCompletion = 0.0
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsToCompletion -= 1
            self.progress = Float(self.secondsToCompletion) / Float(self.workout.exerciseDuration)
            
            if self.secondsToCompletion <= 0 {
                // 1. Start pause
                // 2. Exercise
                // 3. exercise pause
                // 4. Decrease rouds
                // 5. GLobal pause
                // 6. If All rounds is equal to 0 decrease cycles
                // 7. Rollback to .2
                // 8. If all cycles ended save workout to storage
            }
        }
    }
}
