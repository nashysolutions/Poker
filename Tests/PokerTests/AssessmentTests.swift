import XCTest
import PlayingCards
@testable import Poker

final class AssessmentTests: XCTestCase {
    
    private let scores = Score.allCases
    private let ranks = Rank.allCases.sorted()
    
    func testEquality() {
        for rank in ranks {
            for score in scores {
                let lhs = Assessment(score: score, highestRank: rank)
                let rhs = Assessment(score: score, highestRank: rank)
                XCTAssertTrue(lhs == rhs)
            }
        }
    }
    
    func testIncrementingRank() {
        var rankIterator = ranks.makeIterator()
        for score in scores {
            guard let lhsRank = rankIterator.next() else {
                break
            }
            if let rhsRank = rankIterator.next() {
                let lhs = Assessment(score: score, highestRank: lhsRank)
                let rhs = Assessment(score: score, highestRank: rhsRank)
                XCTAssertTrue(lhs < rhs)
            }
        }
    }
    
    func testIncrementingScore() {
        var scoreIterator = scores.makeIterator()
        for rank in ranks {
            guard let lhsScore = scoreIterator.next() else {
                break
            }
            if let rhsScore = scoreIterator.next() {
                let lhs = Assessment(score: lhsScore, highestRank: rank)
                let rhs = Assessment(score: rhsScore, highestRank: rank)
                XCTAssertTrue(lhs < rhs)
            }
        }
    }
    
    func testHighCardDescription() {
        let assessment = Assessment(score: .highCard, highestRank: .seven)
        XCTAssertEqual(assessment.description, "High Card - Seven")
    }
    
    func testPairDescription() {
        let assessment = Assessment(score: .pair, highestRank: .six)
        XCTAssertEqual(assessment.description, "Pocket Six's")
    }
    
    func testTwoPairDescription() {
        let assessment = Assessment(score: .twoPair, highestRank: .eight)
        XCTAssertEqual(assessment.description, "Two Pair - Eight High")
    }
    
    func testThreeKindDescription() {
        let assessment = Assessment(score: .threeKind, highestRank: .four)
        XCTAssertEqual(assessment.description, "Three Kind - Four's")
    }
    
    func testStraightDescription() {
        let assessment = Assessment(score: .straight, highestRank: .nine)
        XCTAssertEqual(assessment.description, "Straight - Nine High")
    }
    
    func testFourKindDescription() {
        let assessment = Assessment(score: .fourKind, highestRank: .nine)
        XCTAssertEqual(assessment.description, "Four Kind - Nine's")
    }
    
    func testFlushDescription() {
        let assessment = Assessment(score: .flush, highestRank: .nine)
        XCTAssertEqual(assessment.description, "Flush")
    }
    
    func testFullHouseDescription() {
        let assessment = Assessment(score: .fullHouse, highestRank: .jack)
        XCTAssertEqual(assessment.description, "Full House - Jack High")
    }
    
    func testStraightFlushDescription() {
        let assessment = Assessment(score: .straightFlush, highestRank: .jack)
        XCTAssertEqual(assessment.description, "Straight Flush - Jack High")
    }
    
    func testRoyalFlushDescription() {
        let assessment = Assessment(score: .royalFlush, highestRank: .jack)
        XCTAssertEqual(assessment.description, "Royal Flush")
    }
}
