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
    var padding: Padding = Padding.small
    var foregroundColor: Color = Color.font
    var backgroundColor: Color = Color.backgroundOffset
    var cornerRadius: Double = 5
    var height: Double = 50
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

