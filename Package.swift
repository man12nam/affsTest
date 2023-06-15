// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Affise",
    products: [
        .library(name: "affise", targets: ["AffiseAttributionLib", "AffiseSKAdNetwork"]),
    ],
    targets: [
        .target(
            name: "AffiseAttributionLib",
            dependencies: [],
            path: "AffiseAttributionLib"
        ),
        .target(
            name: "AffiseSKAdNetwork",
            path: "AffiseSKAdNetwork",
            dependencies: []),
    ]
)
