/* This file was auto-generated by KreMLin! */
#include "kremlib.h"
#ifndef __PKCS11_Attribute_H
#define __PKCS11_Attribute_H


#include "PKCS11_DateTime.h"
#include "PKCS11_TypeDeclaration.h"
#include "PKCS11_Mechanism.h"


uint32_t attributeGetTypeID(attribute_t a);

bool attributeGetReadOnly(attribute_t a);

uint32_t attributeRawGetTypeID(_CK_ATTRIBUTE a);

_CK_VOID_PTR attributeRawGetData(_CK_ATTRIBUTE a);

uint32_t attributeRawGetLength(_CK_ATTRIBUTE a);

bool
_buffer_for_all__PKCS11_TypeDeclaration_attribute_t(
  attribute_t *b,
  uint32_t l,
  bool (*f1)(attribute_t x0),
  uint32_t counter,
  bool tempResult
);

bool
buffer_for_all__PKCS11_TypeDeclaration_attribute_t(
  attribute_t *b,
  uint32_t l,
  bool (*f1)(attribute_t x0)
);

bool attributesForAll(attribute_t *b, uint32_t l, bool (*f1)(attribute_t x0));

bool attributesForAllSeveralFunctions(attribute_t *b, uint32_t l, bool (**fs)(attribute_t x0));

bool attributesIsReadOnly__PKCS11_TypeDeclaration_attribute_t(attribute_t uu___48_478);

bool attributesForAllNotReadOnly(attribute_t *b, uint32_t l);
#endif
