import Testing
@testable import Sparrow


@MainActor
struct AnalyticsServiceTests {

	@Test
	func provider_configures_on_register() {
		let mock = MockAnalyticsProvider()
		AnalyticsService.shared._resetForTests()
		AnalyticsService.shared.register(mock)

		#expect(mock.configured == true)
	}

	@Test
	func track_sends_event_to_provider() {
		let mock = MockAnalyticsProvider()
		AnalyticsService.shared._resetForTests()
		AnalyticsService.shared.register(mock)

		let event = AnalyticsEvent("ingredient_added", properties: ["name": "Tomato"])
		AnalyticsService.shared.track(event)

		#expect(mock.trackedEvents.count == 1)
		#expect(mock.trackedEvents[0].name == "ingredient_added")
		#expect(mock.trackedEvents[0].properties?["name"] as? String == "Tomato")
	}

	@Test
	func identify_sends_user_to_provider() {
		let mock = MockAnalyticsProvider()
		AnalyticsService.shared._resetForTests()
		AnalyticsService.shared.register(mock)

		let user = AppUser("user123", traits: ["tier": "gold"])
		AnalyticsService.shared.identify(user)

		#expect(mock.identifiedUsers.count == 1)
		#expect(mock.identifiedUsers[0].userId == "user123")
		#expect(mock.identifiedUsers[0].traits?["tier"] as? String == "gold")
	}

	@Test
	func screen_sends_display_to_provider() {
		let mock = MockAnalyticsProvider()
		AnalyticsService.shared._resetForTests()
		AnalyticsService.shared.register(mock)

		let display = Display("Pantry", properties: ["filter": "produce"])
		AnalyticsService.shared.screen(display)

		#expect(mock.screens.count == 1)
		#expect(mock.screens[0].name == "Pantry")
		#expect(mock.screens[0].properties?["filter"] as? String == "produce")
	}
}
