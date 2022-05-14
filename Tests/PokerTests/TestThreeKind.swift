import XCTest
import PlayingCards
@testable import Poker

final class ThreeKindTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.threeKind.example
        cards.sort()
        let hand = ThreeKindAssessor(cards: cards)
        XCTAssertEqual(hand.highestCard?.rank, Rank.two)
    }
    
    func testMinimumSequence() {
        let cards = Score.threeKind.example.dropFirst(3)
        var hand = ThreeKindAssessor(cards: Array(cards).sorted())
        hand.evaluate()
        XCTAssertTrue(cards.count == 2)
        XCTAssertFalse(hand.confirmed)
    }
}
