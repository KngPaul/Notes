//
//  CreditView.swift
//  Notes Watch App
//
//  Created by Paul Onawola on 26/06/2024.
//

import SwiftUI

struct CreditsView: View {
    @State private var random: Int = Int.random(in: 1..<4)
    private var image: String {
        "developer-no\(random)"
    }
    var body: some View {
        VStack(spacing: 3) {
            Image(image)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            HeaderView(title: "Credits")
            
            Text("Paul Onawola")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CreditsView()
}
