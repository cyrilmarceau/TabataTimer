//
//  WorkoutCompletionSheetView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 22/10/2024.
//

import SwiftUI

struct WorkoutCompletionSheetView: View {
    
    let onClose: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.white, .green)
                .font(.system(size: 30))
                .padding(.bottom, 10)
            
            Text("Circuit terminé")
                .font(.title)
            Text("Vous pourrez retrouver ce HIT dans l'historique")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.7))
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: onClose) {
                    Text("Fermer")
                        .frame(width: 150, height: 30)
                        .buttonStyle(.borderedProminent)
                }.buttonStyle(.borderedProminent)
                    .tint(.black)
                Spacer()
            }
        }
        .padding(.top)
        .presentationDetents([.height(230)])
        .interactiveDismissDisabled()
    }
}

#Preview {
    WorkoutCompletionSheetView(onClose: {})
}
