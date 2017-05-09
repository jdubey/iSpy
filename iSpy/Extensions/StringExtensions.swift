//
//  StringExtensions.swift
//  ITG
//
//  Created by James, Jonathon (UK - London) on 01/11/2016.
//  Copyright © 2016 com.itg. All rights reserved.
//

import Foundation
import UIKit

extension String {

    /// The size required to display this string with the specified font.
    ///
    /// - parameter font:   The font used to determine the size of each character.
    /// - parameter width:  Constrain the width to this value. No width constraint if nil.
    /// - parameter height: Constrain the height to this value. No height constraint if nil.
    ///
    /// - returns: The required size.
    func requiredSize(forFont font: UIFont, constrainedToWidth width: CGFloat? = nil, constrainedToHeight height: CGFloat? = nil) -> CGSize {

        let constraintRect = CGSize(width: width ?? .greatestFiniteMagnitude, height: height ?? .greatestFiniteMagnitude)
        return self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size
    }

    /// Uses a regex to validate an e-mail address
    ///
    /// - Returns: true if the string is a valid e-mail address
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    /// Convenience method for string localization.  Eliminates need for using NSLocalizedString
    /// Usage:  "Localization_Key".localized
    /// - Returns: The localized string
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

}
