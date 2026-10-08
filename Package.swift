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
    .package(url: "https://github.com/wisebirds/nestads-partner-ios-sdk-core", from: "1.0.0"),
    .package(url: "https://github.com/covigroup/COVI-iOS-SDK.git", from: "1.2.19")
  ],
  targets: [
    .binaryTarget(
      name: "NestAdsPartnerCovi",
      url: "https://github.com/wisebirds/nestads-partner-ios-sdk-covi/releases/download/1.0.0/NestAdsPartnerCovi.xcframework.zip",
      checksum: "5118255e63166ce9687d0f9b39dc0061fc6f2da2afc30e17f0b38d2c98849a0b"
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
