import XCTest
import PlayingCards
@testable import Poker

final class RankTests: XCTestCase {
    
    private let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]

    func testComparable() {
        XCTAssertEqual(ranks, Rank.allCases.sorted())
    }
    
    func testInit() {
        let scoreValues: [Int] = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
        let mapped: [Rank] = scoreValues.compactMap(Rank.init)
        XCTAssertEqual(ranks, mapped)
    }
}
