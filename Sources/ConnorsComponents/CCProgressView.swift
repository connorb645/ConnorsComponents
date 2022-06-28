//
//  CCProgressView.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCProgressView: View {
    let size: Double
    let cornerRadius: Double
    let foregroundColor: Color
    let backgroundColor: Color
        
    public init(size: Double = 50.0,
                cornerRadius: Double = 5.0,
                foregroundColor: Color = .white,
                backgroundColor: Color = .pink) {
        self.size = size
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .frame(width: size, height: size)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
        }
    }
}

@available(iOS 14.0, *)
struct CCProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CCProgressView()
    }
}
