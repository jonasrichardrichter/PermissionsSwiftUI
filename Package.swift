// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let permissionsTargets: [Target] = [
    .target(
        name: "CorePermissionsSwiftUI",  //Internal module for shared code
        dependencies: ["SwiftUIIntrospect"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        resources: [.process("Resources")]
    ),
    .target(
        name: "PermissionsSwiftUI",  //Maintain backward compatibility - access to all permissions
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI", "PermissionsSwiftUITracking", "PermissionsSwiftUIBluetooth", "PermissionsSwiftUICalendar", "PermissionsSwiftUICamera", "PermissionsSwiftUIContacts", "PermissionsSwiftUILocation", "PermissionsSwiftUILocationAlways", "PermissionsSwiftUIMicrophone", "PermissionsSwiftUIMotion", "PermissionsSwiftUIMusic", "PermissionsSwiftUINotification", "PermissionsSwiftUIPhoto", "PermissionsSwiftUIReminder", "PermissionsSwiftUISpeech", "PermissionsSwiftUIHealth"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUIBluetooth",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUICalendar",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
            .define("PERMISSIONSWIFTUI_EVENT")
        ]
    ),
    .target(
        name: "PermissionsSwiftUICamera",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUIContacts",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUIHealth",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
                        .define("PERMISSIONSWIFTUI_HEALTH")
                    ]
    ),
    .target(
        name: "PermissionsSwiftUILocationAlways",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
            .define("PERMISSIONSWIFTUI_LOCATION")
        ]
    ),
    .target(
        name: "PermissionsSwiftUILocation",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
            .define("PERMISSIONSWIFTUI_LOCATION")
        ]
    ),
    .target(
        name: "PermissionsSwiftUIMicrophone",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUIMotion",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUIMusic",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUINotification",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
            .define("PERMISSIONSWIFTUI_NOTIFICATION")
        ]
    ),
    .target(
        name: "PermissionsSwiftUIPhoto",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
            .define("PERMISSIONSWIFTUI_PHOTO")
        ]
    ),
    .target(
        name: "PermissionsSwiftUIReminder",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"],
        swiftSettings: [
            .define("PERMISSIONSWIFTUI_EVENT")
        ]
    ),
    .target(
        name: "PermissionsSwiftUISpeech",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUITracking",
        dependencies: ["SwiftUIIntrospect", .target(name: "CorePermissionsSwiftUI")],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUISiri",
        dependencies: ["SwiftUIIntrospect", "CorePermissionsSwiftUI"],
        exclude: ["../../Tests/PermissionsSwiftUITests/__Snapshots__"]
    ),
    .target(
        name: "PermissionsSwiftUIBiometrics",
        dependencies: ["SwiftUIIntrospect", .target(name: "CorePermissionsSwiftUI")],
        exclude: ["../../Tsts/PermissionsSwiftUITests/__Snapshots__"]
    )]

let package = Package(
    name: "PermissionsSwiftUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: permissionsTargets.map{Product.library(name: $0.name, targets: [$0.name])},
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", "1.0.0"..<"2.0.0"),
        .package(name: "SwiftUIIntrospect", url: "https://github.com/siteline/SwiftUI-Introspect", "1.0.0"..<"2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .testTarget(name: "PermissionsSwiftUITests",
                    dependencies: ["SnapshotTesting", "PermissionsSwiftUI", "CorePermissionsSwiftUI"],
                    exclude: [],
                    resources: [.process("__Snapshots__")]),
        .testTarget(
            name: "PermissionsSwiftUISmallScreenTests",
            dependencies: ["SnapshotTesting"] + permissionsTargets
                                                    .map{Target.Dependency(stringLiteral: $0.name)},
            exclude: [],
            resources: [.process("__Snapshots__")]
        ),
        
    ] + permissionsTargets
)
