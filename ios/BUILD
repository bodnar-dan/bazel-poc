# Copyright (c) 2022 Baracoda. All rights reserved
#
# Copying this file via any medium without the prior written consent of Baracoda is strictly
# prohibited
#
# Proprietary and confidential

load("@build_bazel_rules_apple//apple:ios.bzl", "ios_framework")
load("@build_bazel_rules_ios//rules:framework.bzl", "apple_framework_packaging")

MIN_IOS_VERSION = "13.0"

apple_framework_packaging(
    name = "DataProviderFramework",
    framework_name = "DataProvider",
    visibility = ["//visibility:public"],
    transitive_deps = [
        "//ios/objc:DataCore",
    ],
    deps = [
        "//ios/swift:DataProvider",
    ],
)

genrule(
    name = "PatchedDataCore",
    srcs = [":DataCore"],
    outs = [
        "DataCore.framework",
        "DataCore.framework.dSYM",
    ],
    output_to_bindir = 1,
    tools = ["patch_ios_framework.sh"],
    cmd = """
        bash $(location patch_ios_framework.sh) "$(SRCS)" "$(OUTS)"
    """
)

ios_framework(
    name = "DataCore",
    bundle_id = "com.baracoda.data-core",
    hdrs = [
        "//ios/objc:Headers",
        "headers/DataCore.h",
    ],
    families = [
        "iphone",
        "ipad",
    ],
    resources = [
        "modulemap/module.modulemap"
    ],
    infoplists = ["Info.plist"],
    minimum_os_version = MIN_IOS_VERSION,
    visibility = ["//visibility:public"],
    deps = [
        "//ios/objc:DataCore",
    ],
)