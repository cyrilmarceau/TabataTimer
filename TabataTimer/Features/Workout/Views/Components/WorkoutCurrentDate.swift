//
//  WorkoutCurrentDate.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 24/10/2024.
//

import SwiftUI


struct WorkoutCurrentDate: View {
    
    var body: some View {
        HStack {
            Image(systemName: "clock").bold()
            
            Text("\(Date.now.dayOfWeek()) \(Date.now.formattedDate())").bold()
            
            Spacer()
            
            Text(Date.now.formattedTime()).bold()
            
        }.padding()
    }
}

#Preview {
    WorkoutCurrentDate()
}
