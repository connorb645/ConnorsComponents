//
//  CCPasswordTextField.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CCPasswordTextField: View {
    @Binding var password: String
    let isSecure: Bool
    let placeholder: String
    let padding: Padding
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    let height: Double
    
    public init(password: Binding<String>,
                  isSecure: Bool,
                  placeholder: String = "Password",
                  padding: Padding = Padding.small,
                  foregroundColor: Color = Color.font,
                  backgroundColor: Color = Color.backgroundOffset,
                  cornerRadius: Double = 5,
                  height: Double = 50) {
        self._password = password
        self.isSecure = isSecure
        self.placeholder = placeholder
        self.padding = padding
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.height = height
    }
    
    public var body: some View {
        ZStack {
            if isSecure {
                CCSecureTextField(text: $password,
                                  placeholder: placeholder,
                                  padding: padding,
                                  foregroundColor: foregroundColor,
                                  backgroundColor: backgroundColor,
                                  cornerRadius: cornerRadius,
                                  height: height)
                    .textInputAutocapitalization(.never)
            } else {
                CCTextField(text: $password,
                            placeholder: placeholder,
                            padding: padding,
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                            cornerRadius: cornerRadius,
                            height: height)
                    .textInputAutocapitalization(.never)
            }
        }
    }
}

@available(iOS 15.0, *)
struct CCPasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        CCPasswordTextField(password: .constant(""),
                            isSecure: true,
                            placeholder: "Password")
    }
}
