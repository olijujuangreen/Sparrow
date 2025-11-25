//
//  Display.swift
//  Sparrow
//
//  Created by Olijujuan Green on 11/25/25.
//

import Foundation

/// A representation of a screen or view displayed to the user.
///
/// `Display` identifies a screen by name and carries optional
/// properties describing the context of the view. It is used to
/// record screen or page appearances in analytics.
public struct Display: Sendable {
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
