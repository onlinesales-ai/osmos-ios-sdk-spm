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
            exact: "2.1.0"
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
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v3.1.0/osmos-ios-sdk-3.1.0.zip",
            checksum: "71def40b5d32159e2de5676e07708d8e4139035b25a2ec129aee390ac50010ae"
        )
    ]
)
