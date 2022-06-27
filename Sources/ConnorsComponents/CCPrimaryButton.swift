//
//  CCPrimaryButton.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCPrimaryButton: View {
    let title: String
    var textColor: Color = Color.white
    var backgroundColor: Color = Color.primary
    var cornerRadius: Double = 5.0
    var height: Double = 50
    let onTap: () -> Void
    
    public var body: some View {
        Button {
            onTap()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                
                Text(title)
                    .foregroundColor(textColor)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
    }
}

@available(iOS 14.0, *)
struct CCPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CCPrimaryButton(title: "Button Title") {
            print("Button Tapped")
        }
    }
}
