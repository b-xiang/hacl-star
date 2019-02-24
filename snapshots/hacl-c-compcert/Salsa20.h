/* This file was auto-generated by KreMLin! */
#include "kremlib.h"
#ifndef __Salsa20_H
#define __Salsa20_H


#include "FStar.h"
#include "testlib.h"

typedef uint32_t Hacl_Impl_Xor_Lemmas_u32;

typedef uint8_t Hacl_Impl_Xor_Lemmas_u8;

typedef uint32_t Hacl_Lib_Create_h32;

typedef uint8_t *Hacl_Lib_LoadStore32_uint8_p;

typedef uint32_t Hacl_Impl_Salsa20_u32;

typedef uint32_t Hacl_Impl_Salsa20_h32;

typedef uint8_t *Hacl_Impl_Salsa20_uint8_p;

typedef uint32_t *Hacl_Impl_Salsa20_state;

typedef uint32_t Hacl_Impl_Salsa20_idx;

typedef struct 
{
  void *k;
  void *n;
}
Hacl_Impl_Salsa20_log_t_;

typedef void *Hacl_Impl_Salsa20_log_t;

typedef uint32_t Hacl_Impl_HSalsa20_h32;

typedef uint32_t Hacl_Impl_HSalsa20_u32;

typedef uint8_t *Hacl_Impl_HSalsa20_uint8_p;

typedef uint32_t *Hacl_Impl_HSalsa20_state;

typedef uint8_t *Salsa20_uint8_p;

typedef uint32_t Salsa20_uint32_t;

void *Salsa20_op_String_Access(FStar_Monotonic_HyperStack_mem h, uint8_t *b);

typedef uint32_t *Salsa20_state;

void
Salsa20_salsa20(
  uint8_t *output,
  uint8_t *plain,
  uint32_t len,
  uint8_t *k,
  uint8_t *n1,
  uint64_t ctr
);

void Salsa20_hsalsa20(uint8_t *output, uint8_t *key, uint8_t *nonce);
#endif