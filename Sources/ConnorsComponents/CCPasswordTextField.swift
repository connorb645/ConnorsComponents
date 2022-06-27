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
    var placeholder: String = "Password"
    var background: Color = Color.backgroundOffset
    var padding: Padding = Padding.small
    var foregroundColor: Color = Color.font
    var cornerRadius: Double = 5
    var height: Double = 50
    
    public var body: some View {
        ZStack {
            if isSecure {
                CCSecureTextField(text: $password,
                                  placeholder: placeholder,
                                  background: background,
                                  padding: padding,
                                  foregroundColor: foregroundColor,
                                  cornerRadius: cornerRadius,
                                  height: height)
                    .textInputAutocapitalization(.never)
            } else {
                CCTextField(text: $password,
                            placeholder: placeholder,
                            background: background,
                            padding: padding,
                            foregroundColor: foregroundColor,
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
