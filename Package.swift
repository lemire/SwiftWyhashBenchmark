// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftWyhashBenchmark",
    dependencies: [
   .package(url: "https://github.com/lemire/SwiftWyhash.git", from: "0.1.1"),
   .package(url: "https://github.com/lemire/Swimsuit.git", from: "0.1.3")
    ],
    targets: [
        .target(
            name: "SwiftWyhashBenchmark",
            dependencies: ["SwiftWyhash", "Swimsuit"]),
    ]
)
