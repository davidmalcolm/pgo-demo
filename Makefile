test: pgo-demo-opt
	./pgo-demo-opt

clean:
	rm -f pgo-demo-train pgo-demo-opt pgo-demo.c.* pgo-demo.gcda

pgo-demo-train: pgo-demo.c Makefile
	gcc $< -o $@ -fprofile-generate -O3

training-data: pgo-demo-train
	./pgo-demo-train

dump-data:
	gcov-dump pgo-demo.gcda

pgo-demo-opt: pgo-demo.c training-data Makefile
	gcc $< -o $@ -fprofile-use -O3 \
	  -fdump-tree-all-graph -fdump-ipa-all-graph
