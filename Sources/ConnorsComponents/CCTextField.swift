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
    let padding: Padding
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    let height: Double
    
    public init(text: Binding<String>,
                placeholder: String,
                padding: Padding = Padding.small,
                foregroundColor: Color = .black,
                backgroundColor: Color = .gray,
                cornerRadius: Double = 5,
                height: Double = 50) {
        self._text = text
        self.placeholder = placeholder
        self.padding = padding
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.height = height
    }
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: height)
            .padding(.horizontal, padding.rawValue)
            .background(backgroundColor)
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

