//
//  DateFormatterExtensions.swift
//  ios-helper
//
//  Created by Dubey, Josh (UK - London) on 07/11/2016.
//  Copyright © 2016 Dubey, Josh (UK - London). All rights reserved.
//

import Foundation

// MARK: - Static formatters
extension DateFormatter {

    /// Returns a short style date formatter in user's locale.  E.g., 7/11/2016
    static let shortStyleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()

    /// Returns a medium style date formatter in user's locale.  E.g., 7 Nov 2016
    static let mediumStyleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    /// Returns a long style date formatter in user's locale.  E.g., 7 November 2016
    static let longStyleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()

    /// Returns a short style date/time formatter in user's locale.  E.g., 07/11/2016, 16:37
    static let shortStyleDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    /// Returns a medium style date/time formatter in user's locale.  E.g., 7 Nov 2016, 16:37:56
    static let mediumStyleDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()

    /// Returns a long style style date/time formatter in user's locale.  E.g., 7 November 2016 at 16:37:56 GMT
    static let longStyleDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        return formatter
    }()

    /// Returns a DateFormatter using en_US_POSIX locale.  E.g.,2016-11-07 16:40:37.266972.  en_US_POSIX is a locale that's specifically designed to yield US English results regardless of both user and system preferences.  Good for storing consistently formatted strings on a server or in a database.
    static let posixStyleDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier:"en_US_POSIX" )
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        return formatter
    }()

}
