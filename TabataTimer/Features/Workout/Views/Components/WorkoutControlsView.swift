//
//  WorkoutControlsView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 22/10/2024.
//

import SwiftUI

struct WorkoutControlsView: View {
    @ObservedObject var vm: WorkoutViewModel
    
    var body: some View {
        HStack {
            WorkoutButton(title: "Annuler", systemImage: "stop.fill", action: vm.cancelWorkout, color: .red)
            
            Spacer()
            
            WorkoutButton.makeIt(for: vm.state, viewModel: vm)
            
        }
    }
}

struct WorkoutButton: View {
    let title: String
    let systemImage: String
    let action: () -> Void
    let color: Color
    
    init(title: String, systemImage: String, action: @escaping () -> Void, color: Color) {
        self.title = title
        self.systemImage = systemImage
        self.action = action
        self.color = color
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                Text(title)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .tint(color)
        .padding()
        
    }
}

#Preview {
    WorkoutControlsView(vm: WorkoutViewModel())
}
