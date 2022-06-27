//
//  CCPrimaryButton.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CCPrimaryButton: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    let height: Double
    let onTap: () -> Void
    
    public init(title: String,
         textColor: Color = Color.white,
         backgroundColor: Color = Color.primary,
         cornerRadius: Double = 5.0,
         height: Double = 45.0,
         onTap: @escaping () -> Void) {
        self.title = title
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.height = height
        self.onTap = onTap
    }
    
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

@available(iOS 13.0, *)
struct CCPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CCPrimaryButton(title: "Button Title") {
            print("Button Tapped")
        }
    }
}
