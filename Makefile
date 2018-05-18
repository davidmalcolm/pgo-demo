test: pgo-demo-opt
	./pgo-demo-opt

clean:
	rm -f pgo-demo-train pgo-demo-opt *.c.* *.cc.* *.gcda

SOURCES=devirt.cc \
	loop-opts.c \
	main.c \
	not-inlinable.c \
	presentation-inlined.c \
	presentation-not-inlined.c \
	workload.c

DEPS=$(SOURCES) Makefile shared.h

GCC_BUILD_DIR=/home/david/coding-3/gcc-git-static-analysis/build/gcc
CC=$(GCC_BUILD_DIR)/xgcc -B$(GCC_BUILD_DIR)
GCOV_DUMP=$(GCC_BUILD_DIR)/gcov-dump

pgo-demo-train: $(DEPS)
	$(CC) $(SOURCES) -o $@ -fprofile-generate -O3 -g \
	  -fsave-optimization-record

training-data: pgo-demo-train
	./pgo-demo-train
	./pgo-demo-train
	./pgo-demo-train

dump-data: training-data
	$(GCOV_DUMP) main.gcda workload.gcda

pgo-demo-opt: $(DEPS) training-data
	$(CC) $(SOURCES) -o $@ -fprofile-use -O3 -g \
	  -fsave-optimization-record \
	  -fdump-tree-all-graph -fdump-ipa-all-graph -fdump-rtl-all-graph

# AutoFDO experiments

pgo-demo-uninstrumented: main.c workload.c Makefile
	$(CC) main.c workload.c -o $@ -O3 -g

perf-training-data: pgo-demo-uninstrumented
	perf record -- ./pgo-demo-uninstrumented

dump-perf: perf.data
	perf report
