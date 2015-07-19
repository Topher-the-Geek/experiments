
cc_library(
    name = "lib",
    srcs = glob (["src/**/*.cpp"]),
    deps = ["@tbb//:tbb"]
)

cc_test(
    name = "test",
    srcs = glob(["test/**/*.cpp"]),
    deps = [":lib", "@gtest//:gtest"],
    linkstatic = 1
)
