//
//  AppUser.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

/// A user identity used for analytics.
///
/// `AppUser` identifies a user by a stable `userId` and optional
/// trait metadata. Traits provide additional structured context
/// about the user when reporting analytics.
public struct AppUser: Sendable {
	public let userId: String
	public let traits: [String: Sendable]?

	public init(
		_ userId: String,
		traits: [String: Sendable]? = nil
	) {
		self.userId = userId
		self.traits = traits
	}
}
