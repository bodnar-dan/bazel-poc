# Copyright (c) 2022 Baracoda. All rights reserved
#
# Copying this file via any medium without the prior written consent of Baracoda is strictly
# prohibited
#
# Proprietary and confidential

filegroup(
    name = "Headers",
    srcs = [
        "DataController.h"
    ],
    visibility = ["//:ios"],
)

objc_library(
    name = "DataCore",
    srcs = [
        "DataController.mm"
    ],
    hdrs = [
        "DataController.h"
    ],
    module_name = "DataCore",
    visibility = ["//:ios"],
)
