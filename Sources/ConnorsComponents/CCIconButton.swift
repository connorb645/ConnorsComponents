//
//  CCIconButton.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CCIconButton: View {
    let iconName: String
    let size: Double
    let cornerRadius: Double
    let foregroundColor: Color
    let backgroundColor: Color
    let isEnabled: Bool
    let action: () -> ()
    
    public init(iconName: String,
                  size: Double = 35,
                  cornerRadius: Double = 10,
                  foregroundColor: Color = .black,
                  backgroundColor: Color = .gray.opacity(0.2),
                  isEnabled: Bool = true,
                  action: @escaping () -> ()) {
        self.iconName = iconName
        self.size = size
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.isEnabled = isEnabled
        self.action = action
    }
    
    public var body: some View {
        Button {
            if isEnabled {
                action()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                
                Image(systemName: iconName)
            }
            .frame(width: size, height: size)
        }
        .foregroundColor(isEnabled ? foregroundColor : .gray)
    }
}

@available(iOS 15.0, *)
struct CCIconButton_Previews: PreviewProvider {
    static var previews: some View {
        CCIconButton(iconName: "paperplane", size: 50) {}
    }
}
