//
//  CCBackgroundView.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct CCBackgroundView<Content: View>: View {
    @ViewBuilder var content: Content
    let backgroundColor: Color // was .background
    
    public init(backgroundColor: Color = .white,
                @ViewBuilder content: () -> Content) {
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            content
        }
    }
}

@available(iOS 14.0, *)
struct CCBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CCBackgroundView() {
            Text("Content Preview")
        }
    }
}
