// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sparrow",
    products: [
        .library(
            name: "Sparrow",
            targets: ["Sparrow"]
        ),
    ],
    targets: [
        .target(
            name: "Sparrow"
        ),
        .testTarget(
            name: "SparrowTests",
            dependencies: ["Sparrow"]
        ),
    ]
)
