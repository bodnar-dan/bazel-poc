# Copyright (c) 2021 Baracoda. All rights reserved
#
# Copying this file via any medium without the prior written consent of Baracoda is strictly
# prohibited
#
# Proprietary and confidential

load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "DataProvider",
    srcs = [
        "DataProvider.swift",
    ],
    module_name = "DataProvider",
    visibility = ["//:ios"],
    deps = [
        "//ios/objc:DataCore"
    ]
)