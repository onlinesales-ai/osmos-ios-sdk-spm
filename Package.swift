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
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v3.0.3/osmos-ios-sdk-3.0.3.zip",
            checksum: "bae9736b77a44a1b84d7eb81f0e459a025fd68cdf0ba22c813dea11c67bfdef0"
        )
    ]
)
