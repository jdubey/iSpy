//
//  DateExtensions.swift
//  ios-helper
//
//  Created by Dubey, Josh (UK - London) on 08/11/2016.
//  Copyright © 2016 Dubey, Josh (UK - London). All rights reserved.
//

import Foundation

extension Date {

    struct Gregorian {
        static let calendar = Calendar(identifier: .gregorian)
    }

    /// Creates a normalized date, i.e. only day, month and year components
    ///
    /// - Returns: normalized date of receiver.  E.g. for 12/10/2016 01:43:12, returns 12/10/2016 00:00:00
    func normalizedDate() -> Date? {
        let components = Gregorian.calendar.dateComponents([.year, .month, .day], from: self)
        return Gregorian.calendar.date(from: components)
    }

    /// Creates a normalized date, i.e. only day, month and year components
    ///
    /// - Returns: normalized tomorrow date of receiver.  E.g. for 12/10/2016 01:43:12, returns 13/10/2016 00:00:00
    func normalizedDateTomorrow() -> Date? {
        let normalizedToday = self.normalizedDate()
        return normalizedToday?.dateByAdding(numberOfDays: 1)
    }

    /// Creates a normalized date, i.e. only day, month and year components
    ///
    /// - Returns: normalized yesterday date of receiver.  E.g. for 12/10/2016 01:43:12, returns 11/10/2016 00:00:00
    func normalizedDateYesterday() -> Date? {
        let normalizedToday = self.normalizedDate()
        return normalizedToday?.dateByAdding(numberOfDays: -1)
    }

    /// Check if date is today
    ///
    /// - Returns: true if receiver is today, false if not
    func isToday() -> Bool {
        return Gregorian.calendar.isDateInToday(self)
    }

    /// Check if a Date is the same day as the receiver
    ///
    /// - Parameter date: the date to check
    /// - Returns: true if date and receiver are on the same day
    func isSameDay(date: Date) -> Bool {
        return Gregorian.calendar.isDate(self, equalTo: date, toGranularity: .day)
    }

    /// Adds the number of Days to the receiver and returns a new Date
    ///
    /// - Parameter numberOfDays: The number of days to advance or recede the date
    /// - Returns: A new date with advanced/receded number of days from the receiver
    func dateByAdding(numberOfDays: Int) -> Date? {
        var components = DateComponents()
        components.day = numberOfDays

        return Gregorian.calendar.date(byAdding: components, to: self)
    }

    /// Convenience method to cast Date to NSDate
    ///
    /// - Returns: The Date as an NSDate
    func toNSDate() -> NSDate {
        return self as NSDate
    }

}

extension NSDate {

    /// Convenience method to cast NSDate to Date
    ///
    /// - Returns: The NSDate as a Date
    func toDate() -> Date {
        return self as Date
    }
}
