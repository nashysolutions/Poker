import XCTest
import PlayingCards
@testable import Poker

final class HandTests: XCTestCase {
    
    private let scores = Score.allCases
    private let ranks = Rank.allCases.sorted()
    
    func testRank() throws {
        var iterator = Rank.allCases.sorted().makeIterator()
        for hand in makeAllPossibleHighCardHands() {
            let rank = try XCTUnwrap(iterator.next())
            XCTAssertEqual(hand.highestRank, rank)
        }
    }
    
    func testAllPossibleHighCardVariantsTotalCount() {
        XCTAssertTrue(makeAllPossibleHighCardVariants().count == 118)
    }
    
    func testInit() throws {
        
        XCTAssertNotNil(Hand(.royalFlush, .ace))
        ranks.dropLast().forEach {
            XCTAssertNil(Hand(.royalFlush, $0))
        }
        
        var iterator = makeAllPossibleHighCardVariants().makeIterator()
        
        for score in scores {
            switch score {
            case .royalFlush:
                break
            default:
                for rank in ranks {
                    let created = try XCTUnwrap(Hand(score, rank), "Returned nil for \(score) \(rank)")
                    let hand = try XCTUnwrap(iterator.next())
                    XCTAssertEqual(hand, created)
                }
            }
        }
        
        
        for score in Score.allCases {
            XCTAssertNotNil(Hand(cards: score.example))
        }
    }
    
    // Let's not test all possible combinations...
    func testCompare() {
        var iterator = scores.makeIterator()
        _ = iterator.next()
        for lhs in scores {
            guard let rhs = iterator.next() else {
                break
            }
            XCTAssertTrue(Hand(lhs, .ace)! < Hand(rhs, .ace)!, "\(lhs) not less than \(rhs)0")
        }
    }
    
    private func makeAllPossibleHighCardVariants() -> [Hand] {
        makeAllPossibleHighCardHands() +
        makeAllPossiblePairHands() +
        makeAllPossibleTwoPairHands() +
        makeAllPossibleThreeKindHands() +
        makeAllPossibleStraightHands() +
        makeAllPossibleFourKindHands() +
        makeAllPossibleFlushHands() +
        makeAllPossibleFullHouseHands() +
        makeAllPossibleStraightFlushHands() +
        [Hand.royalFlush]
    }
    
    private func makeAllPossibleHighCardHands() -> [Hand] {
        ranks.map { Hand.highCard($0) }
    }
    
    private func makeAllPossiblePairHands() -> [Hand] {
        ranks.map { Hand.pair($0) }
    }
    
    private func makeAllPossibleTwoPairHands() -> [Hand] {
        ranks.map { Hand.twoPair($0) }
    }
    
    private func makeAllPossibleThreeKindHands() -> [Hand] {
        ranks.map { Hand.threeKind($0) }
    }
    
    private func makeAllPossibleStraightHands() -> [Hand] {
        ranks.map { Hand.straight($0) }
    }
    
    private func makeAllPossibleFourKindHands() -> [Hand] {
        ranks.map { Hand.fourKind($0) }
    }
    
    private func makeAllPossibleFlushHands() -> [Hand] {
        ranks.map { Hand.flush($0) }
    }
    
    private func makeAllPossibleFullHouseHands() -> [Hand] {
        ranks.map { Hand.fullHouse($0) }
    }
    
    private func makeAllPossibleStraightFlushHands() -> [Hand] {
        ranks.map { Hand.straightFlush($0) }
    }
}
