//
//  ContentView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Accueil", systemImage: "stopwatch"){
                WorkoutView()
            }
            
            Tab("Historique", systemImage: "info.circle"){
                WorkoutHistoryView()
            }
            
            Tab("Paramètre", systemImage: "gear"){
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
