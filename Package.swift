// swift-tools-version:5.8
import PackageDescription


let package = Package(
    name: "Affise",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Affise",
            targets: ["AffiseAttributionLib", "AffiseSKAdNetwork"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AffiseAttributionLib",
            dependecies:[]
        ),
        .target(
            name: "AffiseSKAdNetwork",
            dependecies:[]
//            url: "https://url/to/some/remote/binary/package.zip",
//            checksum: "The checksum of the XCFramework inside the ZIP archive."
        )
    ]
)
