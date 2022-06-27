//
//  CCBackgroundView.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
public struct BackgroundView<Content: View>: View {
    @ViewBuilder var content: Content
    public var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            content
        }
    }
}

@available(iOS 14.0, *)
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView() {
            Text("Content Preview")
        }
    }
}
