test: pgo-demo-opt
	./pgo-demo-opt

clean:
	rm -f pgo-demo-train pgo-demo-opt *.c.* *.gcda

pgo-demo-train: main.c workload.c Makefile
	gcc main.c workload.c -o $@ -fprofile-generate -O3

training-data: pgo-demo-train
	./pgo-demo-train

dump-data:
	gcov-dump main.gcda workload.gcda

pgo-demo-opt: main.c workload.c Makefile
	gcc main.c workload.c -o $@ -fprofile-use -O3 \
	  -fdump-tree-all-graph -fdump-ipa-all-graph
