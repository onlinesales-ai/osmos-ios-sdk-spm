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
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v3.0.2/osmos-ios-sdk-3.0.2.zip",
            checksum: "06d36b2ff2102990c2f92d11b94b1246fa0eb1f0dd25dfe8933d69257eccb63c"
        )
    ]
)
