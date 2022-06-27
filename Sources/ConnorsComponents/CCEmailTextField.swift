//
//  CCEmailFieldView.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CCEmailTextField: View {
    @Binding var emailAddress: String
    let placeholder: String
    let padding: Padding
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    let height: Double
    
    public init(emailAddress: Binding<String>,
                  placeholder: String = "Email Address",
                  padding: Padding = Padding.small,
                  foregroundColor: Color = Color.font,
                  backgroundColor: Color = Color.backgroundOffset,
                  cornerRadius: Double = 5,
                  height: Double = 50) {
        self._emailAddress = emailAddress
        self.placeholder = placeholder
        self.padding = padding
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.height = height
    }
    
    public var body: some View {
        CCTextField(text: $emailAddress,
                    placeholder: placeholder,
                    padding: padding,
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor,
                    cornerRadius: cornerRadius,
                    height: height)
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
    }
}

@available(iOS 15.0, *)
struct CCEmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        CCEmailTextField(emailAddress: .constant(""))
    }
}
