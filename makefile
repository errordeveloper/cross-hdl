%.newdir:
	mkdir -p $(@:.newdir=) && cd $(@:.newdir=)

%.delete:
	rm -rf $(@:.delete=)

test:
	@echo "\
	module $@;\n\
	  initial begin $$ \bdisplay(\"Hello World\");\n$$ \bfinish;\nend\n\
	endmodule" \
	> $@.v
	@echo "\
	#include \"V$@.h\"\n\
	#include \"verilated.h\"\n\
	int main(int argc, char **argv, char **env) {\n\
	  Verilated::commandArgs(argc, argv);\n\
	  V$@* top = new V$@;\n\
	  while (!Verilated::gotFinish()) { top->eval(); }\n\
	  exit(0);\n\
	}"\
	> $@.cpp
