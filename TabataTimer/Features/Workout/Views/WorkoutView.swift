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
    
    
    var body: some View {
        NavigationStack {
            VStack{
                
                WorkoutCurrentDate()

                WorkoutMetricsGridView(vm: vm)
                    .padding(.horizontal)
                    .animation(.linear, value: UUID())
                
                Spacer()
                
                CircularProgressIndicatorView(progress: $vm.progress,secondsToComplete: $vm.secondsToCompletion)
                    .padding()
                
                WorkoutControlsView(vm: vm)
                
            }
            .sheet(isPresented: $vm.isSheetPresented) {
                WorkoutCompletionSheetView(onClose: vm.closeSheet)
            }
            
            .navigationTitle("Accueil")
            .navigationBarTitleDisplayMode(.inline)
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
