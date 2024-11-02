//
//  WorkoutCurrentDate.swift
//  TabataTimer
//
//  Created by Cyril Marceau on 24/10/2024.
//

import SwiftUI


struct WorkoutCurrentDate: View {
    
    @StateObject private var vm = WorkoutCurrentDateViewModel()
    
    var body: some View {
        HStack {
            Image(systemName: "clock").bold()
            
            Text(vm.currentDate).bold()
            
            Spacer()
            
            Text(vm.currentTime).bold()
            
        }.padding()
    }
}

#Preview {
    WorkoutCurrentDate()
}
