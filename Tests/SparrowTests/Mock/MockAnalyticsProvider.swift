//
//  MockAnalyticsProvider.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation
@testable import Sparrow

final class MockAnalyticsProvider: AnalyticsProvider {
	private(set) var trackedEvents: [AnalyticsEvent] = []
	private(set) var identifiedUsers: [AppUser] = []
	private(set) var screens: [Display] = []
	private(set) var configured = false

	func configure() {
		configured = true
	}

	func track(_ event: AnalyticsEvent) {
		trackedEvents.append(event)
	}

	func identify(_ user: AppUser) {
		identifiedUsers.append(user)
	}

	func screen(_ display: Display) {
		screens.append(display)
	}
}
