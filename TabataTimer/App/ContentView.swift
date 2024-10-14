//
//  ContentView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let settingsViewModel = SettingsViewModel()
        let workoutViewModel = WorkoutViewModel()
        
        TabView {
            Tab("Accueil", systemImage: "stopwatch") {
                WorkoutView()
                    .environmentObject(workoutViewModel)
            }
            
            Tab("Historique", systemImage: "info.circle") {
                WorkoutHistoryView()
            }
            
            Tab("Paramètres", systemImage: "gear") {
                SettingsView()
                    .environmentObject(settingsViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
