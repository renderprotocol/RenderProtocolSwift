// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RenderProtocolSwift",
    platforms: [
        .iOS(.v18), .macOS(.v15), .watchOS(.v11), .tvOS(.v18), .visionOS(.v2)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RenderProtocolSwift",
            targets: ["RenderProtocol"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift-2.git", from: "2.2.1"),
        .package(url: "https://github.com/grpc/grpc-swift-nio-transport.git", from: "2.4.0"),
        .package(url: "https://github.com/renderprotocol/RPGeneratedSwift.git", branch: "main"),
        .package(url: "https://github.com/renderprotocol/RPUtilsSwift.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RenderProtocol",
            dependencies: [
                .product(name: "GRPCCore", package: "grpc-swift-2"),
                .product(name: "GRPCNIOTransportHTTP2", package: "grpc-swift-nio-transport"),
                .product(name: "RPGeneratedSwift", package: "RPGeneratedSwift"),
                .product(name: "RPUtilsSwift", package: "RPUtilsSwift")
            ]
        ),
        .testTarget(
            name: "RenderProtocolTests",
            dependencies: ["RenderProtocol"]
        ),
    ],
    swiftLanguageModes: [.v5, .v6]
)
