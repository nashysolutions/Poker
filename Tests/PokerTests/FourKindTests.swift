import XCTest
import PlayingCards
@testable import Poker

final class FourKindTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.fourKind.example
        cards.sort()
        let assessment = FourKindAssessor(cards: cards)
        XCTAssertEqual(assessment.highestCard?.rank, Rank.seven)
    }
    
    func testMinimumSequence() {
        let cards = Score.fourKind.example.dropFirst(2)
        var assessment = FourKindAssessor(cards: Array(cards).sorted())
        assessment.evaluate()
        XCTAssertTrue(cards.count == 3)
        XCTAssertFalse(assessment.confirmed)
    }
}
