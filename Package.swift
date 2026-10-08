// swift-tools-version:5.9
import PackageDescription
let package = Package(
  name: "NestAdsPartnerCovi",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "NestAdsPartnerCovi",
      targets: ["NestAdsPartnerCoviWrapper"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/wisebirds/nestads-partner-ios-sdk-core", from: "0.0.1"),
    .package(url: "https://github.com/covigroup/COVI-iOS-SDK.git", from: "1.2.19")
  ],
  targets: [
    .binaryTarget(
      name: "NestAdsPartnerCovi",
      url: "https://github.com/wisebirds/nestads-partner-ios-sdk-covi/releases/download/0.0.1/NestAdsPartnerCovi.xcframework.zip",
      checksum: "ed668b4719aef39c223313837eb2a05f0408ea3288a60165e100044859f5a8e5"
    ),
    .target(
      name: "NestAdsPartnerCoviWrapper",
      dependencies: [
        "NestAdsPartnerCovi",
        .product(name: "NestAdsPartnerCore", package: "nestads-partner-ios-sdk-core"),
        .product(name: "COVI-iOS-SDK", package: "COVI-iOS-SDK")
      ],
      path: "Sources/Wrapper"
    )
  ]
)
