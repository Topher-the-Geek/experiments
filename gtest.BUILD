
cc_library(
    name = "gtest",
    srcs = glob(
        ["gtest-1.7.0/src/**/*.cc"],
        exclude = ["gtest-1.7.0/src/gtest-all.cc"]
    ),
    hdrs = glob(["gtest-1.7.0/include/**/*.h"]),
    includes = [
        "gtest-1.7.0",
        "gtest-1.7.0/include"
    ],
    linkopts = ["-pthread"],
    visibility = ["//visibility:public"],
)
