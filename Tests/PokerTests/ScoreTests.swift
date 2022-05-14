import XCTest
@testable import Poker

final class ScoreTests: XCTestCase {

    func testHighCardDescription() {
        XCTAssertEqual(Score.highCard.description, "High Card")
    }
    
    func testPairDescription() {
        XCTAssertEqual(Score.pair.description, "Pair")
    }
    
    func testTwoPairDescription() {
        XCTAssertEqual(Score.twoPair.description, "Two Pair")
    }
    
    func testThreeKindDescription() {
        XCTAssertEqual(Score.threeKind.description, "Three Kind")
    }
    
    func testStraightDescription() {
        XCTAssertEqual(Score.straight.description, "Straight")
    }
    
    func testFourKindDescription() {
        XCTAssertEqual(Score.fourKind.description, "Four Kind")
    }
    
    func testFlushDescription() {
        XCTAssertEqual(Score.flush.description, "Flush")
    }
    
    func testFullHouseDescription() {
        XCTAssertEqual(Score.fullHouse.description, "Full House")
    }
    
    func testStraightFlushDescription() {
        XCTAssertEqual(Score.straightFlush.description, "Straight Flush")
    }
    
    func testRoyalFlushDescription() {
        XCTAssertEqual(Score.royalFlush.description, "Royal Flush")
    }
}
