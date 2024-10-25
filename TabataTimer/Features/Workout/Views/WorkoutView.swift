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
    @State private var isShowingCreateWorkoutForm: Bool = false
    
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
            .sheet(isPresented: $isShowingCreateWorkoutForm) {
                WorkoutFormView().environmentObject(WorkoutFormViewModel())
            }
            
            .navigationTitle("Accueil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingCreateWorkoutForm.toggle()
                    }) {
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
