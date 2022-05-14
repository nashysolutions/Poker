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
            ClubCard(rank: .four),
            ClubCard(rank: .ace),
            ClubCard(rank: .five),
            ClubCard(rank: .two),
            ClubCard(rank: .three),
            ClubCard(rank: .seven),
            ClubCard(rank: .six)
        ]
        cards.sort()
        let assessment = FlushAssessor(cards: cards)
        XCTAssertTrue(assessment.confirmed)
    }
}
