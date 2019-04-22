.PHONY: default generate_tests build_solutions

default:
	echo "there is no default task"

build_solutions:
	cd solutions ; make

generate_tests:  build_solutions
	mkdir -p tests && ./scripts/gen_tests.py
