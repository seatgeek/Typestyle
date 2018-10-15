//
//  Typestyle+Chaining.swift
//  Typestyle
//
//  Created by Ed Paulosky on 10/15/18.
//  Copyright © 2018 SeatGeek. All rights reserved.
//

import UIKit

extension Typestyle {

    public func aligned(_ alignment: NSTextAlignment) -> Typestyle {
        var copy = self
        copy.alignment = alignment
        return copy
    }

    public func colored(_ color: UIColor) -> Typestyle {
        var copy = self
        copy.color = color
        return copy
    }

    public func spaced(_ characterSpacing: CGFloat?) -> Typestyle {
        var copy = self
        copy.characterSpacing = characterSpacing
        return copy
    }

    public func withLineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Typestyle {
        var copy = self
        copy.lineBreakMode = lineBreakMode
        return copy
    }

    public func withLineHeight(_ lineHeight: CGFloat?) -> Typestyle {
        var copy = self
        copy.lineHeight = lineHeight
        return copy
    }

    public func sized(_ size: CGFloat) -> Typestyle {
        var copy = self
        copy.size = size
        return copy
    }
}
