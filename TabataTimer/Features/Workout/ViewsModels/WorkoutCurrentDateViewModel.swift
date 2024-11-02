//
//  WorkoutDateViewModel.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 02/11/2024.
//

import Foundation

class WorkoutCurrentDateViewModel: ObservableObject {

    @Published var currentDate: String = ""
    @Published var currentTime: String = ""

    var timer = Timer()

    init() {
        let repeatEveryXSeconds: TimeInterval = 1
        timer = Timer.scheduledTimer(withTimeInterval: repeatEveryXSeconds, repeats: true) { _ in
            self.currentDate = "\(Date.now.dayOfWeek()) \(Date.now.formattedDate())"
            self.currentTime = Date.now.formattedTime()
        }
    }
}
