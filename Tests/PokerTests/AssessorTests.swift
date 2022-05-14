import XCTest
import PlayingCards
@testable import Poker

final class AssessorTests: XCTestCase {
    
    private struct Assessor: Assessable {
        let score: Score? = nil
        let cards: [PlayingCard]
        mutating func evaluate() {}
        init(cards: [PlayingCard]) {
            self.cards = cards
        }
        var confirmed: Bool = false
        var highCards: Set<PlayingCard> {
            Set(cards)
        }
    }
    
    func testIsLower() {
        let hand1 = Assessor(cards:[
            ClubCard(rank: .nine),
            ClubCard(rank: .eight)
        ])
        let hand2 = Assessor(cards: [
            HeartCard(rank: .queen),
            ClubCard(rank: .king)
        ])
        XCTAssertTrue(hand1.isLower(than: hand2))
    }
}
