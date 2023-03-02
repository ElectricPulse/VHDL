timestamps=$(shell ls | grep -P '[^ ]+\.vhd' | sed -e 's#^top.vhd$$##' -e 's#.vhd##' -e 's#\b#.timestamp_#')
vhdfiles = $(shell ls | grep -P '[^ ]+\.vhd')
default: test

.timestamp_%: %.vhd
	@export name=$$(echo $^ | sed --expression 's#.vhdl##')
	@touch ".timestamp_$$name"
	@ghdl -a $^

list:
	echo $(vhdfiles)

debug: $(timestamps)
	@ghdl -r test --assert-level=none --wave=test-wave.ghw
	@gtkwave test-wave.ghw

clean: list
	@echo "Warning this is destructive"
	@plist=$$(ls); for element in $(vhdfiles); do plist=$$(echo $$plist | sed -e "s#$$element##" -e "s#Makefile##" ); done; for element in $$plist; do rm -dr $$element; done



test: $(timestamps)
	@ghdl -r test
