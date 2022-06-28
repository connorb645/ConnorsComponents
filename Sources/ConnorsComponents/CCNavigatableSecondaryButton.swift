//
//  CCNavigatableSecondaryButton.swift
//  
//
//  Created by Connor Black on 28/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCNavigatableSecondaryButton<Destination: View>: View {
    let destination: Destination
    let title: String
    let textColor: Color
    let isUnderlined: Bool
    let height: Double
    
    public init(title: String,
                textColor: Color = .black,
                isUnderlined: Bool = true,
                height: Double = 50,
                destination: () -> Destination) {
        self.destination = destination()
        self.title = title
        self.textColor = textColor
        self.isUnderlined = isUnderlined
        self.height = height
    }
    
    public var body: some View {
        NavigationLink {
            destination
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
            .frame(height: height)
        }
    }
}

@available(iOS 14.0, *)
struct CCNavigatableSecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CCNavigatableSecondaryButton(title: "Go to hello world") {
            Text("Hello World")
        }
    }
}
