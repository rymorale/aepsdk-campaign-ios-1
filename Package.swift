// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
/*
 Copyright 2021 Adobe. All rights reserved.
 This file is licensed to you under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License. You may obtain a copy
 of the License at http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software distributed under
 the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
 OF ANY KIND, either express or implied. See the License for the specific language
 governing permissions and limitations under the License.
 */

import PackageDescription

let package = Package(
    name: "AEPCampaign",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "AEPCampaign", targets: ["AEPCampaign"])
    ],
    dependencies: [
        .package(name: "AEPCore", url: "https://github.com/adobe/aepsdk-core-ios.git", .branch( "main")),
        .package(name: "AEPRulesEngine", url: "https://github.com/adobe/aepsdk-rulesengine-ios.git", .branch("dev-v1.0.2")),
    ],
    targets: [
        .target(name: "AEPCampaign",
                dependencies: ["AEPCore", "AEPRulesEngine", .product(name: "AEPServices", package: "AEPCore"), .product(name: "AEPIdentity", package: "AEPCore")],
                path: "AEPCampaign/Sources"),
        .target(name: "AEPCampaignTests",
                dependencies: ["AEPCampaign", "AEPCore", "AEPRulesEngine", .product(name: "AEPServices", package: "AEPCore"), .product(name: "AEPIdentity", package: "AEPCore")],
                path: "AEPCampaign/Tests"),
    ]
)
