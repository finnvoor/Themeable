// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Themeable",
    platforms: [.iOS(.v17)],
    products: [.library(name: "Themeable", targets: ["Themeable"])],
    dependencies: [.package(url: "git@github.com:sindresorhus/Defaults.git", from: "7.0.0")],
    targets: [.target(name: "Themeable", dependencies: [.product(name: "Defaults", package: "Defaults")])]
)
