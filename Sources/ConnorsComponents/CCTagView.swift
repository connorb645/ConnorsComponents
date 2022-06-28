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
    
    public init(text: String,
                isComplete: Bool) {
        self.text = text
        self.isComplete = isComplete
    }
    
    fileprivate func size(using font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self.text as NSString).size(withAttributes: attributes)
        return size
    }
}

@available(iOS 14.0, *)
public struct CCTagView: View {
    let tags: [Tag]
    let font: UIFont
    let padding: Padding
    let margin: Padding
    let strikethroughColor: Color // white
    let tagForegroundSelectedColor: Color // .white
    let tagForegroundUnselectedColor: Color // .font
    let tagBackgroundSelectedColor: Color // .primary
    let tagBackgroundUnselectedColor: Color // .backgroundOffset
    
    public init(tags: [Tag],
                font: UIFont = UIFont.systemFont(ofSize: 14),
                padding: Padding = Padding.small,
                margin: Padding = Padding.small,
                strikethroughColor: Color = .white,
                tagForegroundSelectedColor: Color = .white,
                tagForegroundUnselectedColor: Color = .black,
                tagBackgroundSelectedColor: Color = .pink,
                tagBackgroundUnselectedColor: Color = .gray) {
        self.tags = tags
        self.font = font
        self.padding = padding
        self.margin = margin
        self.strikethroughColor = strikethroughColor
        self.tagForegroundSelectedColor = tagForegroundSelectedColor
        self.tagForegroundUnselectedColor = tagForegroundUnselectedColor
        self.tagBackgroundSelectedColor = tagBackgroundSelectedColor
        self.tagBackgroundUnselectedColor = tagBackgroundUnselectedColor
    }
    
    public var body: some View {
        LazyVStack(alignment: .leading, spacing: margin.rawValue) {
            ForEach(rows(availableWidth: UIScreen.main.bounds.width)) { tagRow in
                LazyHStack(spacing: margin.rawValue) {
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
            .strikethrough(isComplete, color: strikethroughColor)
            .font(Font(uiFont: font))
            .foregroundColor(isComplete ? tagForegroundSelectedColor : tagForegroundUnselectedColor)
            .padding(padding.rawValue)
            .background(RoundedRectangle(cornerRadius: 5)
                            .fill(isComplete ? tagBackgroundSelectedColor : tagBackgroundUnselectedColor))
    }
    
    private func rows(availableWidth: Double) -> [TagRow] {
        var rows: [TagRow] = []
        
        var currentRow: [Tag] = []
        tags.enumerated().forEach { i, tag in
            let taggableItem = tag
            let itemPaddingWidth = padding.rawValue * 2
            let width = taggableItem.size(using: font).width + itemPaddingWidth
            let totalMarginWidth = CGFloat((tags.count - 1)) * margin.rawValue
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
