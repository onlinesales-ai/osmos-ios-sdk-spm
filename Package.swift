// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "osmos-ios-sdk-spm",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "osmos",
            targets: ["osmos"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "osmos",
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v2.0.1/osmos-2.0.1.zip",
            checksum: "f6b7495a944b2ec0bfc97c8b0ec4ed1ee93203b36915f1a71c07dc02a247e695"
        )

    ]
)
