
cc_library(
    name = "lib",
    srcs = glob (["src/**/*.cpp"])
)

cc_test(
    name = "test",
    srcs = glob(["test/**/*.cpp"]),
    deps = [":lib", "@gtest//:main"]
)
