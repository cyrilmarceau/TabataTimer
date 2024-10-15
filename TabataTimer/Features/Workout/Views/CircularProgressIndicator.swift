//
//  CircularProgressIndicator.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 15/10/2024.
//

import SwiftUI

struct CircularProgressIndicator: View {
    
    @Binding var progress: Float
    
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
        }.animation(.linear(duration: 1.0), value: progress)
    }
}
