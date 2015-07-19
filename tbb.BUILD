
cc_library(
    name = "tbb",
    srcs = select({
        "//:darwin": [
            "src/empty.cc",
            "lib/libtbb.dylib"
        ],
        "//:linux": [
            "lib/intel64/gcc4.4/libtbb.so",
            "lib/intel64/gcc4.4/libtbb.so.2"
        ]
    }),
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    linkstatic = 1,
    visibility = ["//visibility:public"],
)
