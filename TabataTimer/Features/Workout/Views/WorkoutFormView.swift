//
//  WorkoutFormView.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 25/10/2024.
//

import SwiftUI

struct WorkoutFormView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var preparation: Int = 0
    @State private var duration: Int = 0
    
    @State private var rest: Int = 0
    @State private var rounds: Int = 0
    @State private var cycles: Int = 0
    @State private var restCycle: Int = 0
    
    
    var body: some View {
        Form {
            // Section for preparation, exercise, and rest durations
            Section(header: Text("Durées")) {
                
                Picker("Préparation", selection: $preparation) {
                    ForEach(1..<100) { i in
                        Text("\(i) secs")
                    }
                }
                
                Picker("Durée", selection: $duration) {
                    ForEach(1..<100) { i in
                        Text("\(i) secs")
                    }
                }
                
                Picker("Pause", selection: $rest) {
                    ForEach(1..<100) { i in
                        Text("\(i) secs")
                    }
                }
                
            }
            
            // Section for rounds and cycles
            Section(header: Text("Configuration du HIT")) {
                Picker("Rounds", selection: $rounds) {
                    ForEach(1..<100) { i in
                        Text("\(i)")
                    }
                }
                Picker("Cycles", selection: $cycles) {
                    ForEach(1..<100) { i in
                        Text("\(i)")
                    }
                }
            }
            // Section for rest after cycle
            Section(header: Text("Cycle")) {
                
                Picker("Cycles", selection: $cycles) {
                    ForEach(1..<100) { i in
                        Text("\(i) secs")
                    }
                }
            }
        }
        .navigationTitle("Intervales")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("", systemImage: "xmark", action: {
                    dismiss()
                })
            }
        })
    }
    
}
