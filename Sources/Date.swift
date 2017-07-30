//
//  Date.swift
//  Revolver
//
//  Created by Petr Mánek on 30.07.17.
//  Copyright © 2017 Petr Manek. All rights reserved.
//


#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    import Darwin.C
    import struct Foundation.Date
#elseif os(Linux)
    import Glibc
    import Foundation
    import Swift
    
// Imported from:
// https://gist.github.com/DonaldHays/8e5b2831313acfaea86b


/// A `TimeInterval` represents a length of time in seconds.
public typealias TimeInterval = Double

/// A `Date` represents a single point in time.
public struct Date: Hashable, Comparable, CustomStringConvertible {
    // MARK: -
    // MARK: Public Properties
    
    /// The time interval between January 1, 1970 at 0:00:00 UTC and the
    /// receiver.
    public var timeIntervalSince1970: TimeInterval
    
    /// The time interval between the current point in time and the receiver.
    public var timeIntervalSinceNow: TimeInterval {
        return timeIntervalSince(Date())
    }
    
    public var description: String {
        return "<Date \(timeIntervalSince1970)>"
    }
    
    public var hashValue: Int {
        return timeIntervalSince1970.hashValue
    }
    
    // MARK: -
    // MARK: Lifecycle
    
    /// Creates a `Date` the represents the current point in time.
    public init() {
        var clock: clock_serv_t = clock_serv_t()
        var timeSpecBuffer: mach_timespec_t = mach_timespec_t(tv_sec: 0, tv_nsec: 0)
        
        host_get_clock_service(mach_host_self(), CALENDAR_CLOCK, &clock)
        clock_get_time(clock, &timeSpecBuffer)
        mach_port_deallocate(mach_task_self_, clock)
        
        timeIntervalSince1970 = Double(timeSpecBuffer.tv_sec) + Double(timeSpecBuffer.tv_nsec) * 0.000000001
    }
    
    /// Creates a `Date` representing an interval of time after January 1, 1970
    /// at 0:00:00 UTC. Provide a negative value to specify a point in time
    /// before the epoch.
    public init(timeIntervalSince1970: TimeInterval) {
        self.timeIntervalSince1970 = timeIntervalSince1970
    }
    
    /// Creates a `Date` representing an interval of time after the current
    /// point in time. Provide a negative value to specify a point in time
    /// before the current point in time.
    public init(timeIntervalSinceNow: TimeInterval) {
        self.timeIntervalSince1970 = Date().timeIntervalSince1970 + timeIntervalSinceNow
    }
    
    // MARK: -
    // MARK: Public API
    
    /// Returns the time interval between the receiver and the specified date.
    /// The returned value will be positive if the receiver occurs after the
    /// specified date, and negative if it occurs before.
    public func timeIntervalSince(date: Date) -> TimeInterval {
        return timeIntervalSince1970 - date.timeIntervalSince1970
    }
}

public func == (lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func < (lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}

public func + (lhs: Date, rhs: TimeInterval) -> Date {
    return Date(timeIntervalSince1970: lhs.timeIntervalSince1970 + rhs)
}

public func += (lhs: inout Date, rhs: TimeInterval) {
    lhs.timeIntervalSince1970 += rhs
}

public func - (lhs: Date, rhs: Date) -> TimeInterval {
    return lhs.timeIntervalSince(rhs)
}

public func - (lhs: Date, rhs: TimeInterval) -> Date {
    return Date(timeIntervalSince1970: lhs.timeIntervalSince1970 - rhs)
}

public func -= (lhs: inout Date, rhs: TimeInterval) {
    lhs.timeIntervalSince1970 -= rhs
}

#endif
