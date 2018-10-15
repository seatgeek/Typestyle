//
//  Label.swift
//  Typestyle
//
//  Created by Ed Paulosky on 10/15/18.
//  Copyright © 2018 SeatGeek. All rights reserved.
//

import UIKit

/// A Label subclass to make Typestyles + Labels ez pz.
/// Usage: Set the typestyle or sgTypestyle on a label, and then you can set text and the label properties as you normally would
/*
 * let label = Label(typestyle: .title)
 * label.textColor = .black
 * label.textAlignment = .center
 * label.lineBreakMode = .wordWrapping
 * label.text = "My Text"
 */
@objc(SGLabel)
public class Label: UILabel {

    // MARK: - ObjC Factory

    @objc public static func labelWithTypestyle(_ typestyle: SGObjcTypestyle) -> Label {
        return Label(typestyle: typestyle.typestyle)
    }

    // MARK: - Initialization

    init(typestyle: Typestyle) {
        self.typestyle = typestyle
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Typestyle

    public var typestyle: Typestyle {
        didSet {
            let t = self.text
            self.text = t
        }
    }

    // MARK: - Overrides

    override public func layoutSubviews() {
        // This layoutsubviews implementation makes line wrapping labels work nicely with autolayout.
        super.layoutSubviews()
        if frame.width > 0 {
            preferredMaxLayoutWidth = frame.width
        }
    }

    override public var text: String? {
        didSet {
            self.attributedText = text?.styled(typestyle)
        }
    }

    override public var textAlignment: NSTextAlignment {
        didSet {
            self.typestyle = typestyle.aligned(textAlignment)
        }
    }

    override public var textColor: UIColor! {
        didSet {
            self.typestyle = typestyle.colored(textColor)
        }
    }

    override public var lineBreakMode: NSLineBreakMode {
        didSet {
            self.typestyle = typestyle.withLineBreakMode(lineBreakMode)
        }
    }

    // Vertically center the text since, on iOS, line-height only adds padding above the text
    override public func drawText(in rect: CGRect) {
        var _rect = rect
        if let lineHeight = typestyle.lineHeight {
            let extraPadding = lineHeight - typestyle.font.ascender + typestyle.font.descender
            if extraPadding > 0 {
                _rect.origin.y = _rect.origin.y - (extraPadding / 2)
            }
        }
        super.drawText(in: _rect)
    }
}
