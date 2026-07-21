// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Distribution package for the OSMOS iOS SDK.
//
// Why a wrapper target + one binary target?
// osmos.xcframework publicly re-exports the OsmosNetworkAdCore module
// (`@_exported import OsmosNetworkAdCore` in its swiftinterface), so any app
// compiling against osmos must also have OsmosNetworkAdCore available.
// SPM binaryTargets cannot declare dependencies, so the source-less wrapper
// target "OsmosWrapper" pulls in the osmos binary plus OsmosNetworkAdCore —
// integrators add the single "osmos" product and get everything they need.
//
// OsmosNetworkAdCore itself comes from osmos-ios-network-ad-core-spm rather
// than an inline binaryTarget here: osmos-gam-adapter-ios-spm (and any future
// adapter) also needs OsmosNetworkAdCore, and depends on that same package.
// Two independent inline binaryTargets both named "OsmosNetworkAdCore" would
// conflict ("multiple similar targets") the moment an app depends on both this
// package and an adapter package — pointing both at one shared upstream
// package lets SPM dedupe it instead.
//
// Release workflow:
//   1. Build osmos.xcframework (ios-os-sdk/build-xcframework.sh)
//   2. Zip it and upload to the GitHub release
//   3. swift package compute-checksum <zip>
//   4. Update url + checksum below, tag and push this repo
//   (OsmosNetworkAdCore releases independently via osmos-ios-network-ad-core-spm)

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
            from: "1.0.0"
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
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v2.2.0/osmos-2.2.0.zip",
            checksum: "5ffca8a33e3550eb846d1c1f7b987b727726e34e489c0c50e19effd8cd0abe9a"
        )
    ]
)
