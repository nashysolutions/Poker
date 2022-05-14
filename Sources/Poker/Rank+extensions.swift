import Foundation
import PlayingCards

extension Rank: Comparable {
    
    var scoreValue: Int {
        switch self {
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .jack:
            return 11
        case .queen:
            return 12
        case .king:
            return 13
        case .ace:
            return 14
        }
    }
    
    init?(_ scoreValue: Int) {
        switch scoreValue {
        case 2:
            self = .two
        case 3:
            self = .three
        case 4:
            self = .four
        case 5:
            self = .five
        case 6:
            self = .six
        case 7:
            self = .seven
        case 8:
            self = .eight
        case 9:
            self = .nine
        case 10:
            self = .ten
        case 11:
            self = .jack
        case 12:
            self = .queen
        case 13:
            self = .king
        case 14:
            self = .ace
        default:
            return nil
        }
    }
    
    public static func <(lhs: Rank, rhs: Rank) -> Bool {
        lhs.scoreValue < rhs.scoreValue
    }
}
