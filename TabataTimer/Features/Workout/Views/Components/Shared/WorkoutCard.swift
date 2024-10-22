//
//  WorkoutCard.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 22/10/2024.
//

import SwiftUI

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
