//
//  CircularProgressIndicator.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 15/10/2024.
//

import SwiftUI

struct CircularProgressIndicatorView: View {
    
    @Binding var progress: Float
    @Binding var secondsToComplete: TimeInterval
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8.0)
                .opacity(0.7)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.orange)
            // Start animation to 12 o'clock
                .rotationEffect(Angle(degrees: 270))
            
            Text(secondsToComplete.format).font(.system(size: 90))
        }.animation(.linear(duration: 0.3), value: progress)
    }
}

#Preview {
    @Previewable @State var progress: Float = 0.4
    @Previewable @State var secondsToComplete: TimeInterval = 30
    
    CircularProgressIndicatorView(
        progress: $progress,
        secondsToComplete: $secondsToComplete
    )
}
