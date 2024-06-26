//
//  Note.swift
//  Notes Watch App
//
//  Created by Paul Onawola on 25/06/2024.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
    let timestamp: Date = Date.now
}
