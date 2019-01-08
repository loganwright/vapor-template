// swift-tools-version:#(swiftToolsVersion)
import PackageDescription
//asdfasdf
let package = Package(
    name: "#(packageName)",
    dependencies: [#for(dependency in dependencies) {
        // #(dependency.comment)
        .package(url: #(dependency.gitUrl), from: #(dependency.version)),
    }],
    targets: [
        .target(name: "App", dependencies: [
            #for(dependency in dependencies) {#for(include in dependency.importTargets) {"#(include)",
            }}]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
