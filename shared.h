#ifdef __cplusplus
extern "C" {
#endif

extern int count;
extern int flag;

extern void not_inlinable (void);

extern void devirt_cc_body (void);
extern void loop_opts_c_body (void);
extern void workload_c_body (void);

extern void accumulate (int x, int *a);
extern int compute_sum_with_inlining (int arr[], int n);
extern int compute_sum_without_inlining (int arr[], int n);

#ifdef __cplusplus
};
#endif
