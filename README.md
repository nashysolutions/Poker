# Poker

![iOS](https://img.shields.io/badge/iOS-13%2B-blue)
![macOS](https://img.shields.io/badge/macOS-10.15%2B-blue)
![tvOS](https://img.shields.io/badge/tvOS-13%2B-blue)
![watchOS](https://img.shields.io/badge/watchOS-6%2B-blue)

Maps a collection of cards to a poker hand, based on the rules of [Texas hold'em](https://en.wikipedia.org/wiki/Texas_hold_%27em).

```swift
let cards: [PlayingCard]
let hand: Hand? = Hand(cards: cards)

// Provides the highest relevant rank of the hand.
// The winning hand can be established using the less than operator (<) or sort().
enum Hand: Comparable {
    case highCard(Rank)
    case pair(Rank)
    case twoPair(Rank)
    case threeKind(Rank)
    case straight(Rank)
    case fourKind(Rank)
    case flush(Rank)
    case fullHouse(Rank)
    case straightFlush(Rank)
    case royalFlush
}

print(hand?.description ?? "Only able to parse card count 2...7.")
```

Dependency: [PlayingCards](https://github.com/nashysolutions/PlayingCards)
