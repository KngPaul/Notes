//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Paul Onawola on 25/06/2024.
//

import SwiftUI

struct DetailView: View {
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    let note: Note
    let count: Int
    let index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HeaderView()
            
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3.weight(.semibold))
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            }
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    let sampleData = Note(id: UUID(), text: "Hello world")
    return DetailView(note: sampleData, count: 5, index: 1)
}
