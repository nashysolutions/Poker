import XCTest
import PlayingCards
@testable import Poker

final class DealTests: XCTestCase {
    
    func testTooFewCards() {
        var deck = Deck()
        let cards = deck.deal(cards: 1)
        XCTAssertNil(Hand(cards: cards))
    }
    
    func testTooManyCards() {
        var deck = Deck()
        let cards = deck.deal(cards: 8)
        XCTAssertNil(Hand(cards: cards))
    }
    
    func testSort() throws {
        var cards = Score.straight.example
        XCTAssertEqual(cards.last?.rank, Rank.five)
        cards.shuffle()
        let game = try XCTUnwrap(Deal(cards: cards))
        XCTAssertEqual(game.cards.last?.rank, Rank.six)
    }
    
    func testEvaluatePair() throws {
        let score = Score.pair
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateTwoPair() throws {
        let score = Score.twoPair
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateThreeKind() throws {
        let score = Score.threeKind
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateStraight() throws {
        let score = Score.straight
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateFourKind() throws {
        let score = Score.fourKind
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateFlush() throws {
        let score = Score.flush
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateFullHouse() throws {
        let score = Score.fullHouse
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluateStraightFlush() throws {
        let score = Score.straightFlush
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, score)
    }
    
    func testEvaluteHighCard() throws {
        let score = Score.highCard
        let cards = score.example
        let game = try XCTUnwrap(Deal(cards: cards))
        let assessment = game.evaluate()
        XCTAssertEqual(assessment.score, .highCard)
//        XCTAssertEqual(assessment.highestRank, .king)
    }
}
