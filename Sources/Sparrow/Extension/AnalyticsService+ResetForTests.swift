//
//  AnalyticsService+ResetForTests.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

public extension AnalyticsService {
/// Removes all registered analytics providers.
///
/// This method exists solely for test isolation. It clears the internal
/// provider list so each test can configure its own state without
/// cross-contamination from previous executions.
	func _resetForTests() {
		providers.removeAll()
	}
}

