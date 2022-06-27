//
//  CCTagView.swift
//  
//
//  Created by Connor Black on 27/06/2022.
//

import SwiftUI

fileprivate struct TagRow: Identifiable, Hashable {
    var id: String {
        tags.reduce("") { partialResult, tag in
            "\(partialResult)-\(tag.id)"
        }
    }
    let tags: [Tag]
}

public struct Tag: Identifiable, Hashable {
    public var id: String {
        "\(text)-\(isComplete)"
    }
    public let text: String
    public let isComplete: Bool
    
    fileprivate func size(using font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self.text as NSString).size(withAttributes: attributes)
        return size
    }
}

@available(iOS 14.0, *)
public struct CCTagView: View {
    let tags: [Tag]
    var font: UIFont = UIFont.systemFont(ofSize: 14)
    var padding: CGFloat = Padding.small.rawValue
    var margin: CGFloat = Padding.small.rawValue
    
    public var body: some View {
        LazyVStack(alignment: .leading, spacing: margin) {
            ForEach(rows(availableWidth: UIScreen.main.bounds.width)) { tagRow in
                LazyHStack(spacing: margin) {
                    ForEach(tagRow.tags) { tag in
                        tagView(text: tag.text,
                                isComplete: tag.isComplete)
                            
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
        
    @ViewBuilder private func tagView(text: String, isComplete: Bool) -> some View {
        Text(text)
            .strikethrough(isComplete, color: .white)
            .font(Font(uiFont: font))
            .foregroundColor(isComplete ? .white : Color.font)
            .padding(padding)
            .background(RoundedRectangle(cornerRadius: 5)
                            .fill(isComplete ? Color.primary : Color.backgroundOffset))
    }
    
    private func rows(availableWidth: Double) -> [TagRow] {
        var rows: [TagRow] = []
        
        var currentRow: [Tag] = []
        tags.enumerated().forEach { i, tag in
            let taggableItem = tag
            let itemPaddingWidth = padding * 2
            let width = taggableItem.size(using: font).width + itemPaddingWidth
            let totalMarginWidth = CGFloat((tags.count - 1)) * margin
            let currentRowWidth = currentRow.reduce(0.0) { $0 + $1.size(using: font).width } + totalMarginWidth
            
            if currentRowWidth + width > availableWidth {
                rows.append(.init(tags: currentRow))
                currentRow = [taggableItem]
            } else {
                currentRow.append(taggableItem)
            }
            
            let isLastElement = i == tags.count - 1
            if isLastElement {
                rows.append(.init(tags: currentRow))
            }
        }
        
        return rows
    }
}

@available(iOS 14.0, *)
struct CCTagView_Previews: PreviewProvider {
    static var previews: some View {
        CCTagView(tags: [.init(text: "Tag One", isComplete: false),
                         .init(text: "Tag Two", isComplete: true),
                         .init(text: "Tag Three", isComplete: false),
                         .init(text: "Tag Four", isComplete: true)])
    }
}
