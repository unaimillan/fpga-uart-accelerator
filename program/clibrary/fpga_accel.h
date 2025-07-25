
#ifdef ACCEL_SUPPORT_DOUBLE64
    #define ACCEL_TYPE double
#elif ACCEL_SUPPORT_FLOAT32
    #define ACCEL_TYPE float
#elif ACCEL_SUPPORT_INT32
    #define ACCEL_TYPE int32_t
#endif // ACCEL_SUPPORT_DOUBLE64


bool check_fpga_connection();

bool open_fpga_connection();

float fpga_add(float, float);

float fpga_subst(float, float);

float fpga_mult(float, float);

float fpga_div(float, float);
