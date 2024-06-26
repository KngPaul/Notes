//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Paul Onawola on 26/06/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Double = 1.0
    
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(
                value: Binding {
                Double(self.lineCount)
            } set: { newValue in
                self.value = newValue
                self.update()
            },
                   in: 1...4,
                   step: 1)
                .tint(.accent)
        }
    }
    
    func update() {
        lineCount = Int(value)
    }
}

#Preview {
    SettingsView()
}
