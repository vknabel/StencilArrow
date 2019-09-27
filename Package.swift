// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "StencilArrow",
    products: [
        .executable(
            name: "StencilArrow",
            targets: ["StencilArrow"]
        ),
        .library(
            name: "StencilArrowKit",
            targets: ["StencilArrowKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vknabel/ArrowKit.git", .branch("master")),
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.11.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.9.1"),
    ],
    targets: [
        .target(
            name: "StencilArrow",
            dependencies: ["StencilArrowKit"]
        ),
        .target(
            name: "StencilArrowKit",
            dependencies: ["ArrowKit", "Stencil", "PathKit"]
        ),
    ]
)
