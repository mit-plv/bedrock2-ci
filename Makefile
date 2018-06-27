
default_target: bedrock2

.PHONY: bbv riscv-coq bedrock2

# Note: not --recursive, because we don't want to clone the deps in ./bedrock2/deps/
clone_all:
	git submodule update --init

# Note: not --recursive, because we don't want to clone the deps in ./bedrock2/deps/
update_all:
	git submodule update --remote

bbv:
	$(MAKE) -C ./bbv

# riscv-coq always uses ".." as directory for dependencies, no need to configure
riscv-coq: bbv
	$(MAKE) -C ./riscv-coq proofs

# Skip top-level Makefile of bedrock2, because that would build the git
# submodules ./bedrock2/deps/bbv and ./bedrock2/deps/riscv-coq, which we do
# not want to use here.
# Configure the DEPS_DIR to be the directory of this Makefile.
bedrock2: riscv-coq
	DEPS_DIR=../.. $(MAKE) -C ./bedrock2/bedrock2
