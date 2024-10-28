//
//  WorkoutFormView.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 25/10/2024.
//

import SwiftUI

struct WorkoutFormView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: WorkoutFormViewModel
    
    var body: some View {
        VStack {
            Form {
                // Section for preparation, exercise, and rest durations
                Section(header: Text("Durées")) {
                    
                    Picker("Préparation", selection: $vm.preparationDuration) {
                        ForEach(0..<100) { i in
                            Text("\(i) secs")
                        }
                    }
                    
                    Picker("Durée", selection: $vm.exerciseDuration) {
                        ForEach(0..<100) { i in
                            Text("\(i) secs")
                        }
                    }
                    
                    Picker("Pause", selection: $vm.restDuration) {
                        ForEach(0..<100) { i in
                            Text("\(i) secs")
                        }
                    }
                    
                }
                
                // Section for rounds and cycles
                Section(header: Text("Configuration du HIT")) {
                    Picker("Rounds", selection: $vm.round) {
                        ForEach(0..<100) { i in
                            Text("\(i)")
                        }
                    }
                    Picker("Cycles", selection: $vm.cycle) {
                        ForEach(0..<100) { i in
                            Text("\(i)")
                        }
                    }
                }
                // Section for rest after cycle
                Section(header: Text("Cycle")) {
                    Picker("Cycles", selection: $vm.restCycle) {
                        ForEach(0..<100) { i in
                            Text("\(i) secs")
                        }
                    }
                }
            }
        }
        .navigationTitle("Intervales")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    vm.saveWorkoutSettings()
                }) {
                    Image(systemName: "pencil")
                }
            }
            
        })
        
    }
}
