//
//  Font+Extensions.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI
import UIKit

@available(iOS 14.0, *)
extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}
