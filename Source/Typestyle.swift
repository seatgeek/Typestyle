//
//  Typestyle.swift
//  Typestyle
//
//  Created by Ed Paulosky on 10/15/18.
//  Copyright © 2018 SeatGeek. All rights reserved.
//

import UIKit

/// Typestyle provides a way to further customize displaying text
public struct Typestyle {

    // MARK: - Stored Properties

    public var alignment: NSTextAlignment
    public var characterSpacing: CGFloat?
    public var color: UIColor
    public let font: UIFont
    public var lineBreakMode: NSLineBreakMode
    public var lineHeight: CGFloat?

    /// The point size to set on the provided font
    /// - Note: This overrides any size that is set on the UIFont instance
    public var size: CGFloat

    // MARK: - Initialization

    public init(_ font: UIFont,
                size: CGFloat? = nil,
                lineHeight: CGFloat? = nil,
                characterSpacing: CGFloat? = nil,
                color: UIColor = .black,
                alignment: NSTextAlignment = .left,
                lineBreakMode: NSLineBreakMode = .byTruncatingTail) {
        self.font = font
        self.size = size ?? font.pointSize
        self.lineHeight = lineHeight
        self.characterSpacing = characterSpacing
        self.color = color
        self.alignment = alignment
        self.lineBreakMode = lineBreakMode
    }

    // MARK: - Utils

    public var paragraphStyle: NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = lineBreakMode

        if let lineHeight = self.lineHeight {
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
        }

        return paragraphStyle
    }

    public var textAttributes: [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: font.withSize(size),
            NSAttributedString.Key.foregroundColor: color
        ]
        if let characterSpacing = self.characterSpacing {
            attributes[NSAttributedString.Key.kern] = characterSpacing
        }
        return attributes
    }
}
