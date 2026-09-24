// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "osmos-ios-sdk-spm",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "osmos",
            targets: ["OsmosWrapper"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/onlinesales-ai/osmos-ios-network-ad-core-spm",
            exact: "2.0.0"
        )
    ],
    targets: [
        // Source-less dependency bridge — see header comment.
        .target(
            name: "OsmosWrapper",
            dependencies: [
                "osmos",
                .product(name: "OsmosNetworkAdCore", package: "osmos-ios-network-ad-core-spm")
            ],
            path: "Sources/osmos-ios-sdk-spm"
        ),

        .binaryTarget(
            name: "osmos",
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v2.6.3/osmos-ios-sdk-2.6.3.zip",
            checksum: "8a09a40b55648ebe9793caeccd95b8f54a6b44d20493a2a241d7de54370337f6"
        )
    ]
)
