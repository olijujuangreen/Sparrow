//
//  AnalyticsService+MemberwiseTrack.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

public extension AnalyticsService {
	/// Tracks an event using a memberwise convenience API.
	/// - Parameters:
	///   - name: The event name.
	///   - properties: Optional structured properties associated with the event.
	///
	/// This method constructs an `AnalyticsEvent` and forwards it to
	/// `track(_ event:)`. It provides a minimal, ergonomic way to log events
	/// without manually creating an `AnalyticsEvent` instance.
	func track(_ name: String, properties: [String: Sendable]? = nil) {
		track(.init(name, properties: properties))
	}
}

