import XCTest
import PlayingCards
@testable import Poker

final class HighCardTests: XCTestCase {
    
    private var deck = Deck()
    
//    func testEvaluation() {
//        var cards = deck.deal(cards: 3)
//        cards.sort()
//        let hand = HighCard(cards: cards)
//        XCTAssertTrue(hand.confirmed)
//    }
    
    func testHighCard() {
        var cards = deck.deal(cards: 3)
        cards.sort()
        let hand = HighCardAssessor(cards: cards)
        XCTAssertEqual(hand.highestCard, cards.last)
    }
}
