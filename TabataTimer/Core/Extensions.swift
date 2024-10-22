//
//  Extensions.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//


import UIKit

extension UIScreen {
    static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
}


extension TimeInterval {
    var format: String {
            let endingDate = Date()
            let startingDate = endingDate.addingTimeInterval(-self)
            let calendar = Calendar.current

        let componentsNow = calendar.dateComponents([.hour, .minute, .second], from: startingDate, to: endingDate)
            if let minute = componentsNow.minute, let seconds = componentsNow.second {
                return "\(String(format: "%02d", minute)):\(String(format: "%02d", seconds))"
            } else {
                return "00:00"
            }
        }
}


extension WorkoutButton {
    static func makeIt(for state: TimerState, viewModel: WorkoutViewModel) -> WorkoutButton {
        switch state {
        case .active, .resumed:
            return WorkoutButton(title: "Pause", systemImage: "pause.fill", action: viewModel.pauseWorkout, color: .orange)
        case .paused:
            return WorkoutButton(title: "Reprendre", systemImage: "play.fill", action: viewModel.resumeWorkout, color: .green)
        case .cancelled:
            return WorkoutButton(title: "Démarrer", systemImage: "play.fill", action: viewModel.startWorkout, color: .green)
        }
    }
}
