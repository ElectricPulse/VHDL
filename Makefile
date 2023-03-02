timestamps=$(shell ls | grep -P '[^ ]+\.vhdl' | sed -e 's#.vhdl##' -e 's#\b#.timestamp_#')

default: test

.timestamp_%: %.vhdl
	@export name=$$(echo $^ | sed --expression 's#.vhdl##')
	@touch ".timestamp_$$name"
	@ghdl -a $^

debug: $(timestamps)
	@ghdl -r test --wave=test-wave.ghw
	@gtkwave test-wave.ghw

test: $(timestamps)
	@ghdl -r test
