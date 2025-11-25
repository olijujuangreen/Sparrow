//
//  AnalyticsProvider.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

public protocol AnalyticsProvider {
	/// Called once on app launch to configure the provider.
	func configure()

	/// Track a named event with optional structured data.
	func track(_ event: AnalyticsEvent)

	/// Record that a user identified themselves.
	func identify(_ user: AppUser)

	/// Record a screen/page view.
	func screen(_ display: Display)
}
