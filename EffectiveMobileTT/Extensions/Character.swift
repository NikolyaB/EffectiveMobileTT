//
//  Character.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 07.06.2024.
//

import SwiftUI

extension Character {
    var isCyrillic: Bool {
        let scalarValue = unicodeScalars.first!.value
        return (scalarValue >= 0x0400 && scalarValue <= 0x04FF)
            || (scalarValue >= 0x0500 && scalarValue <= 0x052F)
            || (scalarValue >= 0xA640 && scalarValue <= 0xA69F)
            || (scalarValue >= 0x1C80 && scalarValue <= 0x1C8F)
    }
}
