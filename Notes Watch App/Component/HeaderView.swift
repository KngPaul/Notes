//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Paul Onawola on 26/06/2024.
//

import SwiftUI

struct HeaderView: View {
    var title: String?
    
    var body: some View {
        VStack {
            if let title {
                Text(title.uppercased())
                    .font(.title3.bold())
                    .foregroundStyle(.accent)
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundStyle(.accent)
        }
    }
}

#Preview {
    Group {
        HeaderView()
        HeaderView(title: "Credits")
    }
}
