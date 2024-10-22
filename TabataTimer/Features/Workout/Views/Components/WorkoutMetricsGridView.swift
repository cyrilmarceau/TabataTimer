//
//  WorkoutMetricsGridView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 22/10/2024.
//

import SwiftUI


struct WorkoutMetricsGridView: View {
    
    @ObservedObject var vm: WorkoutViewModel
    
    var body: some View {
        VStack {
            HStack {
                WorkoutCard(
                    title: "Démarrage",
                    value: vm.workout.preparationDuration.format,
                    color: Color.brown.opacity(0.5)
                )
                
                WorkoutCard(
                    title: "Pause",
                    value: vm.workout.restCycle.format,
                    color: Color.brown.opacity(0.5)
                )
            }
            
            HStack {
                WorkoutCard(
                    title: "Exercice",
                    value: vm.workout.exerciseDuration.format,
                    color: Color.yellow.opacity(0.5)
                )
                
                WorkoutCard(
                    title: "Pause",
                    value: vm.workout.restDuration.format,
                    color: Color.yellow.opacity(0.5)
                )
            }
            
            
            HStack {
                if vm.state != .active {
                    WorkoutCard(
                        title: "Rounds",
                        value: String(vm.workout.round),
                        color: Color.indigo.opacity(0.5)
                    )
                    
                    WorkoutCard(
                        title: "Cycles",
                        value: String(vm.workout.cycle),
                        color: Color.indigo.opacity(0.5)
                    )
                } else {
                    WorkoutCard(
                        title: "Rounds",
                        value: "\(String(vm.currentRound)) / \(vm.workout.round)" ,
                        color: Color.red.opacity(0.5)
                    )
                    
                    WorkoutCard(
                        title: "Cycles",
                        value: "\(String(vm.currentCycle)) / \(vm.workout.cycle)",
                        color: Color.red.opacity(0.5)
                    )
                }
            }
        }
    }
}

#Preview {
    WorkoutMetricsGridView(vm: WorkoutViewModel())
}
