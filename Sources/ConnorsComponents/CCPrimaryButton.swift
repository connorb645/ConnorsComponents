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
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    let height: Double
    let onTap: (() -> Void)?
    let isLoading: Bool
    
    public init(title: String,
                textColor: Color = .white,
                backgroundColor: Color = .pink,
                cornerRadius: Double = 5.0,
                height: Double = 50,
                isLoading: Bool = false,
                onTap: (() -> Void)?) {
        self.title = title
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.height = height
        self.isLoading = isLoading
        self.onTap = onTap
    }
    
    public var body: some View {
        Button {
            onTap?()
        } label: {
            ZStack {
                if isLoading {
                    CCProgressView()
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                    
                    Text(title)
                        .foregroundColor(textColor)
                }
            }
            .animation(.easeInOut, value: self.isLoading)
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .disabled(isLoading)
    }
}

@available(iOS 14.0, *)
struct CCPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CCPrimaryButton(title: "Button Title", isLoading: false) {
            print("Button Tapped")
        }
    }
}
