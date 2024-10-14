//
//  WorkoutView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import SwiftUI



struct WorkoutView: View {
    @EnvironmentObject var vm: WorkoutViewModel
    
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
                        title: "Exercice",
                        value: "00:30",
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
                        color: Color.cyan.opacity(0.5)
                    )
                    
                }.padding(.horizontal)
                
                Spacer()
                
                Button("Démarrer", systemImage: "arrowtriangle.right.fill", action: {})
                    .buttonStyle(.borderedProminent)
                    .tint(Color.yellow.opacity(5))
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
    WorkoutView().environmentObject(WorkoutViewModel())
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
