//
//  SettingsModel.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import Foundation

struct SettingsModel:  Codable, Identifiable {
    var id: UUID = UUID()
    var soundLevel: Float = 0
    var enabledSound: Bool = false
    var enabledVibration: Bool = false
    var timeFormat: TimeFormat = .mmss
}

enum TimeFormat: String, Codable, CaseIterable {
    case s = "Secondes"
    case mmss = "Minutes / Secondes"
    case hhmmss = "Heures / minutes / secondes"
}
