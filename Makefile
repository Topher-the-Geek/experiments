
# Connect make to bazel.
#
# First, install bazel: http://bazel.io/docs/getting-started.html.
#
# Second, build from your favorite editor, which probably hooks to make easily. Skip trying to
# understand your editor's fiddly esoteric mechanism to connect custom build tools.

.PHONY: default
default:
	bazel test --test_output=errors //task-scheduling:test
