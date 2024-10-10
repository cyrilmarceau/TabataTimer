//
//  SettingsViewModel.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var soundLevel: Float = 0
    @Published var enabledSound: Bool = false
    @Published var enabledVibration: Bool = false
    @Published var timeFormat: TimeFormat = .mmss
}
