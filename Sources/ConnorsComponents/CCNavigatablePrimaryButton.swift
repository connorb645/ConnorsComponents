//
//  CCNavigatablePrimaryButton.swift
//  
//
//  Created by Connor Black on 28/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCNavigatablePrimaryButton<Destination: View>: View {
    let destination: Destination
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    let height: Double
    
    public init(title: String,
                textColor: Color = .white,
                backgroundColor: Color = .pink,
                cornerRadius: Double = 5.0,
                height: Double = 50,
                destination: () -> Destination) {
        self.destination = destination()
        self.title = title
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.height = height
    }
    
    public var body: some View {
        NavigationLink {
            destination
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                
                Text(title)
                    .foregroundColor(textColor)
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
        }
    }
}

@available(iOS 14.0, *)
struct CCNavigatablePrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CCNavigatablePrimaryButton(title: "Go to hello world") {
            Text("Hello World")
        }
    }
}
