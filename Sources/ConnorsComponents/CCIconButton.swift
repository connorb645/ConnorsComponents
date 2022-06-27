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
    var size: Double = 35
    var cornerRadius: Double = 10
    var foregroundColor: Color = .black
    var backgroundColor: Color = .gray.opacity(0.2)
    var isEnabled: Bool = true
    let action: () -> ()
    
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
