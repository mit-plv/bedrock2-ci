
.PHONY: update_all clone_all bbv riscv-coq bedrock2

clone_all:
	git submodule update --init --recursive

update_all:
	git submodule update --recursive --remote

bbv:
	$(MAKE) -C ./bbv

riscv-coq: bbv
	$(MAKE) -C ./riscv-coq proofs

bedrock2: riscv-coq
	$(MAKE) -C ./bedrock2

