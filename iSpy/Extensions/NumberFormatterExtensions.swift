//
//  NumberFormatterExtensions.swift
//  ios-helper
//
//  Created by Dubey, Josh (UK - London) on 07/11/2016.
//  Copyright © 2016 Dubey, Josh (UK - London). All rights reserved.
//

import Foundation

extension NumberFormatter {

    /// Returns a number formatter with currency in the user's locale, and maximum fraction digits = 2
    static let currencyFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()

    /// Returns a number formatter that will convert strings to DecimalNumbers, and maximum fraction digits = 2
    static let decimalNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.generatesDecimalNumbers = true

        return numberFormatter
    }()
}
