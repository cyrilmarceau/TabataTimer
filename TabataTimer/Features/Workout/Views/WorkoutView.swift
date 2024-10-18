//
//  WorkoutView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import SwiftUI
import UIKit

struct WorkoutView: View {
    @EnvironmentObject var vm: WorkoutViewModel
    
    var timerControls: some View {
        Group {
            Button("Annuler", systemImage: "stop.fill", action: {
                vm.cancelWorkout()
            })
            .buttonStyle(.borderedProminent)
            .tint(Color.red.opacity(5))
            .padding()
            
            Spacer()
            
            switch vm.state {
            case .active, .resumed:
                Button("Pause", systemImage: "pause.fill", action: {
                    vm.pauseWorkout()
                })
                .buttonStyle(.borderedProminent)
                .tint(Color.orange.opacity(5))
                .padding()
            case .paused:
                Button("Reprendre", systemImage: "play.fill", action: {
                    vm.resumeWorkout()
                })
                .buttonStyle(.borderedProminent)
                .tint(Color.green.opacity(5))
                .padding()
            case .cancelled:
                Button("Démarrer", systemImage: "play.fill", action: {
                    vm.startWorkout()
                })
                .buttonStyle(.borderedProminent)
                .tint(Color.green.opacity(5))
                .padding()
            }
        }
        
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                
                HStack(spacing: 10) {
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
                }.padding(.horizontal)
                
                HStack(spacing: 10) {
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
                }.padding(.horizontal)
                
                
                HStack(spacing: 10) {
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
                }.padding(.horizontal)
                    .animation(.linear, value: UUID())
                
#if DEBUG
                Text("\(vm.currentStep) for round n°\(vm.currentRound) in cycle n° \(vm.currentCycle)").padding(.horizontal)
#endif
                
                Spacer()
                
                CircularProgressIndicator(
                    progress: $vm.progress,
                    secondsToComplete: $vm.secondsToCompletion
                ).padding()
                
                HStack {
                    timerControls
                }
            }
            
            .navigationTitle("Accueil")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Label("", systemImage: "slider.vertical.3")
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutView()
        .environmentObject(WorkoutViewModel())
}

struct WorkoutCard: View {
    
    let title, value: String
    let color: Color
    
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
