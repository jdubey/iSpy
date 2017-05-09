//
//  CollectionExtensions.swift
//  ITG
//
//  Created by James, Jonathon (UK - London) on 24/10/2016.
//  Copyright © 2016 com.itg. All rights reserved.
//

import Foundation

extension Collection {

    /// Safely get the element at the specified index.
    ///
    /// - parameter index: The index to retrieve the element from.
    ///
    /// - returns: The found element, or nil if the index is out of bounds.
    subscript(safe index: Self.Index) -> Self.Iterator.Element? {

        return index >= self.startIndex && index < self.endIndex ? self[index] : nil
    }

    /// Safely get a subsequence of elements at the specified range.
    ///
    /// - parameter bounds: The range the subsequence should consist of.
    ///
    /// - returns: The subsequence or nil if the range was out of bounds.
    subscript(safe bounds: ClosedRange<Self.Index>) -> Self.SubSequence? {

        return bounds.lowerBound >= self.startIndex && bounds.upperBound < self.endIndex ? self[bounds] : nil
    }
}

extension Collection where Self.IndexDistance == Int {

    ///  Returns a new collection with the following spacer inserted between each
    ///  of the existing elements.
    ///
    /// - parameter spacer: The spacer to insert between the elements.
    ///
    /// - returns: The resultant collection.
    func insertedSpacer(_ spacer: Self.Iterator.Element) -> [Self.Iterator.Element] {

        let range = 0..<2*self.count - 1
        return range.map({ $0 % 2 == 0 ? self[self.index(self.startIndex, offsetBy: $0/2)] : spacer })
    }

    /// Returns a new collection where an object returned by the specified block is
    /// inserted between each of the existing elements.
    ///
    /// - This method should be used if each spacer needs to be unique.
    ///
    /// - parameter block: The block to return the spacer.
    ///
    /// - returns: The resultant collection.
    func insertedSpacer(block: (() -> Self.Iterator.Element)) -> [Self.Iterator.Element] {

        let range = 0..<2*self.count - 1
        return range.map({ $0 % 2 == 0 ? self[self.index(self.startIndex, offsetBy: $0/2)] : block() })
    }
}

extension RangeReplaceableCollection {

    /// Add the given optional element to the collection, if it exists.
    ///
    /// - parameter element: An optional object.
    mutating func safeAppend(_ element: Self.Iterator.Element?) {

        if let element = element {
            self.append(element)
        }
    }
}
