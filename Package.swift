// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Poker",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "Poker",
            targets: ["Poker"]),
    ],
    dependencies: [
        .package(name: "PlayingCards", url: "https://github.com/nashysolutions/PlayingCards.git", .upToNextMinor(from: "2.0.1"))
    ],
    targets: [
        .target(
            name: "Poker",
            dependencies: ["PlayingCards"]),
        .testTarget(
            name: "PokerTests",
            dependencies: ["Poker", "PlayingCards"]),
    ]
)
