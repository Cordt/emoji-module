// swift-tools-version:5.3
import PackageDescription

let isLocalTestMode = true

var deps: [Package.Dependency] = [
    .package(url: "https://github.com/binarybirds/feather-core", from: "1.0.0-beta"),
]

var targets: [Target] = [
    .target(name: "EmojiModule", dependencies: [
        .product(name: "FeatherCore", package: "feather-core"),
    ],
    resources: [
        .copy("Bundle"),
    ]),
]

// @NOTE: https://bugs.swift.org/browse/SR-8658
if isLocalTestMode {
    deps.append(contentsOf: [
        /// drivers
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0-beta"),
        /// core modules
        .package(name: "system-module", url: "https://github.com/feather-modules/system", from: "1.0.0-beta"),
        .package(name: "user-module", url: "https://github.com/feather-modules/user", from: "1.0.0-beta"),
        .package(name: "api-module", url: "https://github.com/feather-modules/api", from: "1.0.0-beta"),
        .package(name: "admin-module", url: "https://github.com/feather-modules/admin", from: "1.0.0-beta"),
        .package(name: "frontend-module", url: "https://github.com/feather-modules/frontend", from: "1.0.0-beta"),
    ])
    targets.append(contentsOf: [
        .target(name: "Feather", dependencies: [
            /// drivers
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            /// core modules
            .product(name: "SystemModule", package: "system-module"),
            .product(name: "UserModule", package: "user-module"),
            .product(name: "ApiModule", package: "api-module"),
            .product(name: "AdminModule", package: "admin-module"),
            .product(name: "FrontendModule", package: "frontend-module"),

            .target(name: "EmojiModule"),
        ]),
        .testTarget(name: "EmojiModuleTests", dependencies: [
            .target(name: "EmojiModule"),
        ])
    ])
}

let package = Package(
    name: "emoji-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "EmojiModule", targets: ["EmojiModule"]),
    ],
    dependencies: deps,
    targets: targets
)
