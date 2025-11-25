//
//  AnalyticsEvent.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

/// A lightweight analytics event containing a name and optional properties.
///
/// `AnalyticsEvent` is a simple data carrier used to record structured
/// analytics events. The `name` identifies the event, and `properties`
/// provides optional additional context.
public struct AnalyticsEvent: Sendable {
	public let name: String
	public let properties: [String: Sendable]?

	public init(
		_ name: String,
		properties: [String: Sendable]? = nil
	) {
		self.name = name
		self.properties = properties
	}
}

