import XCTest
import PlayingCards
@testable import Poker

final class FullHouseTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.fullHouse.example
        cards.sort()
        let assessment = FullHouseAssessor(cards: cards)
        XCTAssertEqual(assessment.highestCard?.rank, Rank.nine)
    }
    
    func testMinimumSequence() {
        let cards = Score.fullHouse.example.dropFirst()
        var assessment = FullHouseAssessor(cards: Array(cards).sorted())
        assessment.evaluate()
        XCTAssertTrue(cards.count == 4)
        XCTAssertFalse(assessment.confirmed)
    }
}
