#ifndef CFUNC_filter_CUH
#define CFUNC_filter_CUH

#include <cufft.h>
#include <cufftXt.h>
#include "defs.cuh"

class cfunc_filter {
  bool is_free = false;

  cufftHandle plan_filter_fwd;
  cufftHandle plan_filter_inv;
  real2* ge;

public:
  size_t n;      // width of square slices
  size_t nproj; // number of angles
  size_t nz;    // number of slices
  size_t ne;
  cfunc_filter(size_t nproj, size_t nz, size_t n);
  ~cfunc_filter();
  void filter(size_t g, size_t w, size_t stream);
  void free();
};

#endif