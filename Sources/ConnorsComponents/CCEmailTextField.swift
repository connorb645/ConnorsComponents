//
//  CCEmailFieldView.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CCEmailFieldView: View {
    @Binding var emailAddress: String
    var placeholder: String = "Email Address"
    
    public var body: some View {
        CCTextField(text: $emailAddress,
                    placeholder: placeholder)
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
    }
}

@available(iOS 15.0, *)
struct EmailFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CCEmailFieldView(emailAddress: .constant(""))
    }
}
