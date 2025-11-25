//
//  AnalyticsService.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

/// A centralized dispatcher that forwards analytics data to registered providers.
///
/// `AnalyticsService` fans out events, screen views, and user identity updates
/// to all configured `AnalyticsProvider` instances. Providers are invoked on the
/// main actor to ensure consistent, UI-safe behavior across the application.
@MainActor
public final class AnalyticsService {
	public static let shared = AnalyticsService()

	/// The list of registered analytics providers.
	public var providers: [AnalyticsProvider] = []

	private init() {}

	/// Registers a provider and invokes its configuration phase.
	/// - Parameter provider: The provider to add.
	public func register(_ provider: AnalyticsProvider) {
		providers.append(provider)
		provider.configure()
	}

	/// Forwards an event to all registered providers.
	/// - Parameter event: The event to record.
	public func track(_ event: AnalyticsEvent) {
		providers.forEach { $0.track(event) }
	}

	/// Forwards a user identity to all registered providers.
	/// - Parameter user: The identified user.
	public func identify(_ user: AppUser) {
		providers.forEach { $0.identify(user) }
	}

	/// Forwards a screen display to all registered providers.
	/// - Parameter display: The screen being displayed.
	public func screen(_ display: Display) {
		providers.forEach { $0.screen(display) }
	}
}
