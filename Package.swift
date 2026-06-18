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
            url: "https://github.com/onlinesales-ai/osmos-ios-sdk/releases/download/osmos-sdk-v2.6.1/osmos-ios-sdk-2.6.1.zip",
            checksum: "183a8f208347e9ce581b4a4c16601d0770bb9af003800d2bec596649c21010c5"
        )

    ]
)
