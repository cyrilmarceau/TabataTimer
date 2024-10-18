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
    
    enum WorkoutStep {
        case preparation
        case exercise
        case rest
        case restCycle
        case completed
    }
    
    @Published var workout: WorkoutModel = WorkoutModel(
        id: UUID(),
        preparationDuration: 2.0,
        exerciseDuration: 5.0,
        restDuration: 3.0,
        round: 5,
        cycle: 4,
        restCycle: 10.0
    )
    
    private var timer: Timer = Timer()
    
    @Published var progress: Float = 0.0
    @Published var secondsToCompletion: TimeInterval = 0
    @Published var state: TimerState = .cancelled
    @Published var currentStep: WorkoutStep = .preparation
    @Published var currentRound: Int = 1
    @Published var currentCycle: Int = 1
    @Published var isRunning: Bool = false
    
    private func startTimer() {
        self.updateProgress()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsToCompletion -= 1
            
            self.updateProgress()
            
            if self.secondsToCompletion == 0 {
                self.goToNextStep()
            }
        }
    }
    
    private func updateProgress() {
        switch currentStep {
        case .preparation:
            progress = Float(secondsToCompletion) / Float(workout.preparationDuration)
        case .exercise:
            progress = Float(secondsToCompletion) / Float(workout.exerciseDuration)
        case .rest:
            progress = Float(secondsToCompletion) / Float(workout.restDuration)
        case .restCycle:
            progress = Float(secondsToCompletion) / Float(workout.restCycle)
        case .completed:
            progress = 1.0
        }
    }
    
    private func goToNextStep() {
        switch currentStep {
        case .preparation:
            currentStep = .exercise
            secondsToCompletion = workout.exerciseDuration
        case .exercise:
            if currentRound < workout.round {
                currentStep = .rest
                secondsToCompletion = workout.restDuration
            } else {
                if currentCycle < workout.cycle {
                    currentStep = .restCycle
                    secondsToCompletion = workout.restCycle
                } else {
                    completeWorkout()
                }
               
            }
        case .rest:
            currentStep = .exercise
            secondsToCompletion = workout.exerciseDuration
            
            if currentRound < workout.round {
                currentRound += 1
            }
        case .restCycle:
            currentStep = .exercise
            secondsToCompletion = workout.exerciseDuration
            if currentCycle < workout.cycle {
                currentCycle += 1
                currentRound = 1
            }
            
        case .completed:
            break;
        }
        
        updateProgress()
    }
    
    func completeWorkout() {
        currentStep = .completed
        state = .cancelled
        timer.invalidate()
        progress = 0
        secondsToCompletion = 0
    }
    
    func startWorkout() {
        currentStep = .preparation
        state = .active
        secondsToCompletion = workout.preparationDuration
        startTimer()
    }
    
    func pauseWorkout() {
        state = .paused
        timer.invalidate()
    }
    
    func resumeWorkout() {
        state = .resumed
        startTimer()
    }
    
    func cancelWorkout() {
        state = .cancelled
        timer.invalidate()
        currentStep = .preparation
        currentRound = 0
        currentCycle = 0
        progress = 0
        secondsToCompletion = 0
    }
}
