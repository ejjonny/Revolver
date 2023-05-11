// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Revolver",
    products: [
        .library(
            name: "Revolver",
            targets: ["Revolver"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "Revolver",
            dependencies: [
                .product(name: "SwiftyJSON", package: "SwiftyJSON"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "RevolverTests",
            dependencies: [
                "Revolver"
            ]
        )
    ]
)
