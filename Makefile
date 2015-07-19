
# Connect make to bazel; also workaround a bug in bazel's new_http_repository.
#
# First, install bazel: http://bazel.io/docs/getting-started.html.
#
# Second, build from your favorite editor, which probably hooks to make easily. Skip trying to
# understand your editor's fiddly esoteric mechanism to connect custom build tools.

TMPTBB = /tmp/tbb
OSNAME = $(shell uname -s | tr 'A-Z' 'a-z')

.PHONY: default
default: ${TMPTBB}/host ${TMPTBB}/darwin/src/empty.cc
	bazel test --define OSNAME=${OSNAME} --test_output=errors //task-scheduling:test

${TMPTBB}/host: ${TMPTBB}/${OSNAME}
	ln -s $< $@

${TMPTBB}/darwin/src/empty.cc: ${TMPTBB}/darwin/src
	touch $@

${TMPTBB}/darwin/src:
	mkdir -p $@

${TMPTBB}/darwin: ${TMPTBB}/darwin.tgz
	shasum -a 256 -c downloads/tbb-darwin.sha256
	tar xz -s /tbb43_20150611oss/tbb-darwin/ -f $<
	mv tbb-darwin $@

${TMPTBB}/darwin.tgz:
	-mkdir ${TMPTBB}
	#curl https://www.threadingbuildingblocks.org/sites/default/files/software_releases/mac/tbb43_20150611oss_osx.tgz -o $@
	cp ~/tmp/tbb-darwin.tgz $@

${TMPTBB}/linux: ${TMPTBB}/linux.tgz
	shasum -a 256 -c downloads/tbb-linux.sha256
	tar xz --xform s/tbb43_20150611oss/tbb-linux/ -f $<
	mv tbb-linux $@

${TMPTBB}/linux.tgz:
	-mkdir ${TMPTBB}
	#curl https://www.threadingbuildingblocks.org/sites/default/files/software_releases/linux/tbb43_20150611oss_lin.tgz -o $@
	cp ~/tmp/tbb-linux.tgz $@

.PHONY: clean
clean:
	-bazel clean
	-rm -rf ${TMPTBB}/{host,darwin,linux}