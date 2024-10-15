//
//  WorkoutView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var vm: WorkoutViewModel
    
    var timerControls: some View {
        Group {
            Button("Annuler", systemImage: "stop.fill", action: stopTimerState)
                .buttonStyle(.borderedProminent)
                .tint(Color.red.opacity(5))
                .padding()
            
            Spacer()
            
            switch vm.state {
            case .active, .resumed:
                Button("Pause", systemImage: "pause.fill", action: {
                    vm.state = .paused
                })
                    .buttonStyle(.borderedProminent)
                    .tint(Color.orange.opacity(5))
                    .padding()
            case .paused:
                Button("Reprendre", systemImage: "play.fill", action: {
                    vm.state = .resumed
                })
                    .buttonStyle(.borderedProminent)
                    .tint(Color.green.opacity(5))
                    .padding()
            case .cancelled:
                Button("Démarrer", systemImage: "play.fill", action: {
                    vm.state = .active
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
                        value: "00:10",
                        color: Color.brown.opacity(0.5)
                    )
                    
                    WorkoutCard(
                        title: "Pause",
                        value: "01:30",
                        color: Color.brown.opacity(0.5)
                    )
                }.padding(.horizontal)
                
                HStack(spacing: 10) {
                    WorkoutCard(
                        title: "Exercice",
                        value: "00:30",
                        color: Color.yellow.opacity(0.5)
                    )
                    
                    WorkoutCard(
                        title: "Pause",
                        value: "00:15",
                        color: Color.yellow.opacity(0.5)
                    )
                }.padding(.horizontal)

                HStack(spacing: 10) {
                    WorkoutCard(
                        title: "Rounds",
                        value: "4",
                        color: Color.indigo.opacity(0.5)
                    )
                    
                    WorkoutCard(
                        title: "Cycles",
                        value: "4",
                        color: Color.indigo.opacity(0.5)
                    )
                    
                }.padding(.horizontal)
                
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
    
    
    
    private func startTimerState() {
        vm.state = .active
    }
    
    private func stopTimerState() {
        vm.state = .cancelled
    }
    
    private func pauseTimerState() {
        vm.state = .paused
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

