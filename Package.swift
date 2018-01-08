// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "StencilArrow",
    dependencies: [
        .package(url: "https://github.com/vknabel/ArrowKit.git", .branch("master")),
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.10.1"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.8.0"),
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
