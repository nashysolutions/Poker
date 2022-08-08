import Foundation
import PlayingCards

struct Assessment: Comparable, CustomStringConvertible {
    
    let score: Score
    let highestRank: Rank
    
    var description: String {
        switch score {
        case .highCard:
            return score.description + " - " + highestRank.rawValue.capitalized
        case .pair:
            return "Pocket " + highestRank.rawValue.capitalized + "'s"
        case .fourKind:
            return score.description + " - " + highestRank.rawValue.capitalized + "'s"
        case .flush:
            return score.description
        case .threeKind:
            return score.description + " - " + highestRank.rawValue.capitalized + "'s"
        case .royalFlush:
            return score.description
        default:
            return score.description + " - " + highestRank.rawValue.capitalized + " High"
        }
    }
    
    static func <(lhs: Assessment, rhs: Assessment) -> Bool {
        if lhs.score == rhs.score {
            return lhs.highestRank < rhs.highestRank
        }
        return lhs.score < rhs.score
    }
}
