//
//  Colors.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 03.06.2024.
//

import SwiftUI

// MARK: design colors
extension Color {
    static let grey1 = Color(hex: "1D1E20")
    static let grey2 = Color(hex: "242529")
    static let grey3 = Color(hex: "2F3035")
    static let grey4 = Color(hex: "3E3F43")
    static let grey5 = Color(hex: "5E5F61")
    static let grey6 = Color(hex: "9F9F9F")
    static let grey7 = Color(hex: "DBDBDB")
    
    static let systemBlack = Color(hex: "0C0C0C")
    static let systemWhite = Color(hex: "FFFFFF")
    static let systemBlue = Color(hex: "2261BC")
    static let systemDarkBlue = Color(hex: "00427D")
    static let systemGreen = Color(hex: "3A633B")
    static let systemDarkGreen = Color(hex: "1E341F")
    static let systemRed = Color(hex: "FF5E5E")
    static let systemOrange = Color(hex: "F36E36")
    
}

// MARK: hex color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
