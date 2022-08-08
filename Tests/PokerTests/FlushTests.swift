import XCTest
import PlayingCards
@testable import Poker

final class FlushTests: XCTestCase {
    
    func testHighCard() {
        var cards = Score.flush.example
        cards.sort()
        let assessment = FlushAssessor(cards: cards)
        XCTAssertEqual(assessment.highestCard?.rank, Rank.jack)
    }
    
    func testMinimumSequence() {
        let cards = Score.flush.example.dropFirst()
        var assessment = FlushAssessor(cards: Array(cards).sorted())
        assessment.evaluate()
        XCTAssertTrue(cards.count == 4)
        XCTAssertFalse(assessment.confirmed)
    }
    
    func testRiver() {
        var cards = [
            PlayingCard(rank: .four, suit: .clubs),
            PlayingCard(rank: .ace, suit: .clubs),
            PlayingCard(rank: .five, suit: .clubs),
            PlayingCard(rank: .two, suit: .clubs),
            PlayingCard(rank: .three, suit: .clubs),
            PlayingCard(rank: .seven, suit: .clubs),
            PlayingCard(rank: .six, suit: .clubs)
        ]
        cards.sort()
        let assessment = FlushAssessor(cards: cards)
        XCTAssertTrue(assessment.confirmed)
    }
}
