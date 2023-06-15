// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Affise",
    products: [
        .library(name: "AffiseAttributionLib", targets: ["AffiseAttributionLib"]),
        .library(name: "AffiseSKAdNetwork", targets: ["AffiseSKAdNetwork"]),
    ],
    targets: [
        .target(
            name: "AffiseAttributionLib",
            dependencies: [],
            path: "AffiseAttributionLib",
            publicHeadersPath:"include"
        ),
        .target(
            name: "AffiseSKAdNetwork",
            dependencies: [],
            path: "AffiseSKAdNetwork",
            publicHeadersPath:"include"
        ),
    ]
)
