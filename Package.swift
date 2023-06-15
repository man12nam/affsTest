// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Affise",
    products: [
        .library(name: "AffiseAttributionLib", targets: ["AffiseAttributionLib"]),
    ],
    targets: [
        .target(
            name: "AffiseAttributionLib",
            dependencies: [],
            path: "AffiseAttributionLib"
        ),
    ]
)
