//
//  Utils.swift
//  Typestyle
//
//  Created by Ed Paulosky on 10/15/18.
//  Copyright © 2018 SeatGeek. All rights reserved.
//

import UIKit

extension NSAttributedString {
    public convenience init(string: String, style: Typestyle) {
        self.init(string: string, attributes: style.textAttributes)
    }
}

extension String {
    public func styled(_ style: Typestyle) -> NSAttributedString {
        return NSMutableAttributedString(string: self, style: style)
    }
}

extension NSString {
    public func styled(_ style: Typestyle) -> NSAttributedString {
        return NSMutableAttributedString(string: self as String, style: style)
    }
}
