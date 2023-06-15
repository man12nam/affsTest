// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Affise",
    products: [
        .library(name: "AffiseSKAdNetwork", targets: ["AffiseSKAdNetwork"]),
    ],
    targets: [
        .target(
            name: "AffiseSKAdNetwork",
            dependencies: [])
//        .testTarget(
//            name: "AffiseAttributionLibTests",
//            dependencies: ["AffiseAttributionLib"]),
    ]
)
