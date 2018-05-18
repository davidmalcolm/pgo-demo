#ifdef __cplusplus
extern "C" {
#endif

extern int count;
extern int flag;

extern void not_inlinable (void);

extern void devirt_cc_body (void);
extern void loop_opts_c_body (void);
extern void workload_c_body (void);

#ifdef __cplusplus
};
#endif
