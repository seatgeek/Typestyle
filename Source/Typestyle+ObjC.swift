//
//  Typestyle+ObjC.swift
//  Typestyle
//
//  Created by Ed Paulosky on 10/15/18.
//  Copyright © 2018 SeatGeek. All rights reserved.
//

import UIKit

/// SGTypestyle is a wrapper around Typestyle to expose it to Objective-C
@objc(SGTypestyle)
final public class SGObjcTypestyle: NSObject {

    // MARK: - Initialization

    init(_ style: Typestyle) {
        self.typestyle = style
    }

    // MARK: - Wrappers

    @nonobjc fileprivate (set) var typestyle: Typestyle

    @objc public var font: UIFont {
        return typestyle.font
    }

    @objc public var size: CGFloat {
        get {
            return typestyle.size
        } set {
            typestyle.size = newValue
        }
    }

    /// Objective-C doesn't support optional value types, so let's use NSNumber
    @objc public var characterSpacing: NSNumber? {
        get {
            if let characterSpacing = typestyle.characterSpacing {
                return NSNumber(value: Float(characterSpacing))
            } else {
                return nil
            }
        } set {
            if let characterSpacing = newValue {
                typestyle.characterSpacing = CGFloat(characterSpacing.floatValue)
            } else {
                typestyle.characterSpacing = nil
            }
        }
    }

    /// Objective-C doesn't support optional value types, so let's use NSNumber
    @objc public var lineHeight: NSNumber? {
        get {
            if let lineHeight = typestyle.lineHeight {
                return NSNumber(value: Float(lineHeight))
            } else {
                return nil
            }
        } set {
            if let lineHeight = newValue {
                typestyle.lineHeight = CGFloat(lineHeight.floatValue)
            } else {
                typestyle.lineHeight = nil
            }
        }
    }

    @objc public var color: UIColor {
        get {
            return typestyle.color
        } set {
            typestyle.color = newValue
        }
    }

    @objc public var alignment: NSTextAlignment {
        get {
            return typestyle.alignment
        } set {
            typestyle.alignment = newValue
        }
    }

    @objc public var lineBreakMode: NSLineBreakMode {
        get {
            return typestyle.lineBreakMode
        } set {
            typestyle.lineBreakMode = newValue
        }
    }

    @objc public var paragraphStyle: NSParagraphStyle {
        return typestyle.paragraphStyle
    }

    @objc public var textAttributes: NSDictionary {
        return typestyle.textAttributes as NSDictionary
    }
}

extension NSAttributedString {
    @nonobjc convenience init(string: NSString, style: SGObjcTypestyle) {
        self.init(string: string as String, style: style.typestyle)
    }
}

extension NSString {
    @objc public func styled(_ style: SGObjcTypestyle) -> NSAttributedString {
        return NSAttributedString(string: self, style: style)
    }
}
