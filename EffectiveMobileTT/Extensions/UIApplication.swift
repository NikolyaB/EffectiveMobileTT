//
//  UIApplication.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 06.06.2024.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
