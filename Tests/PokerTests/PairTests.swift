import XCTest
import PlayingCards
@testable import Poker

final class PairTests: XCTestCase {
    
//    func testEvaluation() {
//        let cards = Score.pair.example
//        let hand = Pair(cards: cards)
//        XCTAssertTrue(hand.confirmed)
//    }
    
    func testHighCard() {
        let cards = Score.pair.example
        let hand = PairAssessor(cards: cards)
        XCTAssertEqual(hand.highestCard?.rank, Rank.two)
    }
}
