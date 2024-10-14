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
            VStack(alignment: .center, spacing: 10) {
                HStack(spacing: 10) {
                    HStack {
                        Text("Démarrage")
                        Spacer()
                        Text("00:10")
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Text("Démarrage")
                        Spacer()
                        Text("00:10")
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                HStack(spacing: 10) {
                    HStack {
                        Text("Démarrage")
                        Spacer()
                        Text("00:10")
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        Text("Démarrage")
                        Spacer()
                        Text("00:10")
                    }
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .navigationTitle("Accueil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Label("", systemImage: "plus.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    WorkoutView().environmentObject(WorkoutViewModel())
}
