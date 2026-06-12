// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "super_native_extensions",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "super_native_extensions", targets: ["super_native_extensions"])
    ],
    targets: [
        .binaryTarget(
            name: "SuperNativeExtensionsRust",
            path: "SuperNativeExtensionsRust.xcframework"
        ),
        .target(
            name: "super_native_extensions",
            dependencies: ["SuperNativeExtensionsRust"],
            path: "Classes",
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("CoreServices"),
                .unsafeFlags(["-Xlinker", "-all_load"])
            ]
        )
    ]
)
