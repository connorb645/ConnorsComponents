//
//  CCTextField.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCTextField: View {
    @Binding var text: String
    let placeholder: String
    var background: Color = Color.backgroundOffset
    var padding: Padding = Padding.small
    var foregroundColor: Color = Color.font
    var cornerRadius: Double = 5
    var height: Double = 50
    public var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: height)
            .padding(.horizontal, padding.rawValue)
            .background(background)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
    }
}

@available(iOS 14.0, *)
struct CCTextField_Previews: PreviewProvider {
    static var previews: some View {
        CCTextField(text: .constant(""),
                    placeholder: "Placeholder text")
    }
}

