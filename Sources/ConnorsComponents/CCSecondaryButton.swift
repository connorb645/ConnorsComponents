//
//  CCSecondaryButton.swift
//  
//
//  Created by Connor Black on 28/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCSecondaryButton: View {
    let title: String
    let textColor: Color
    let height: Double
    let isUnderlined: Bool
    let onTap: (() -> Void)?
    
    public init(title: String,
                textColor: Color = .black,
                height: Double = 45,
                isUnderlined: Bool = true,
                onTap: (() -> Void)?) {
        self.title = title
        self.textColor = textColor
        self.height = height
        self.isUnderlined = isUnderlined
        self.onTap = onTap
    }
    
    public var body: some View {
        Button {
            onTap?()
        } label: {
            VStack {
                if isUnderlined {
                    Text(title)
                        .foregroundColor(textColor)
                        .underline(color: textColor)
                } else {
                    Text(title)
                        .foregroundColor(textColor)
                }
            }
        }
        .frame(height: height)
    }
}

@available(iOS 14.0, *)
struct CCSecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CCSecondaryButton(title: "Button Title") {
            print("Button Tapped")
        }
    }
}
