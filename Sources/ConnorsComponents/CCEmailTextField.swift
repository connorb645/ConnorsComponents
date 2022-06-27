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
    var placeholder: String = "Email Address"
    var padding: Padding = Padding.small
    var foregroundColor: Color = Color.font
    var backgroundColor: Color = Color.backgroundOffset
    var cornerRadius: Double = 5
    var height: Double = 50
    
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
