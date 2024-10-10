//
//  SettingsView.swift
//  TabataTimer
//
//  Created by MARCEAU Cyril on 10/10/2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: SettingsViewModel
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section(header: Text("Son")) {
                    Toggle(
                        "Activer",
                        isOn: $vm.enabledSound
                    )
                    HStack {
                        Image(systemName: vm.soundLevel > 0 ? "speaker.wave.1" : "speaker.slash").animation(.smooth)
                        Slider(
                            value: $vm.soundLevel,
                            in: 0...100
                        )
                        Image(systemName: "speaker.wave.3")
                    }
                    
                }
                
                Section(header: Text("Formattage")) {
                    Picker("Horaire", selection: $vm.timeFormat) {
                        ForEach(TimeFormat.allCases, id: \.self) { timeFormat in
                            Text(timeFormat.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Haptiks")) {
                    Toggle(
                        "Vibration",
                        isOn: $vm.enabledVibration
                    )
                }
            }
            .navigationTitle("Paramètres")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
}
