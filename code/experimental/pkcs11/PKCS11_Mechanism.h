/* This file was auto-generated by KreMLin! */
#include "kremlib.h"
#ifndef __PKCS11_Mechanism_H
#define __PKCS11_Mechanism_H


#include "PKCS11_DateTime.h"
#include "PKCS11_TypeDeclaration.h"


bool isMechanismGeneration(mechanism m);

bool isMechanismFound(mechanism m);

uint32_t mechanismGetType(mechanism m);

void (*mechanismGetFunctionGeneration(mechanism m))(uint8_t *x0, uint32_t x1);

uint32_t mechanismRawGetTypeID(_CK_MECHANISM m);

_CK_VOID_PTR getMechanismRawParameters(_CK_MECHANISM m);

uint32_t getMechanismRawParametersLen(_CK_MECHANISM m);

attribute_t *getAddressOfMechanismAttributes(mechanism m);

uint32_t *getAddressOfMechanismRequiredAttributes(mechanism m);

uint32_t
*getMemoryIndexForMechanism__PKCS11_TypeDeclaration__CK_ULONG(
  uint32_t m,
  uint32_t *b,
  uint32_t len
);

void mechanismLoadAttributes(mechanism m, uint32_t *b, uint32_t len);

void mechanismGiveAttributesRequired(mechanism m, uint32_t *b, uint32_t len);

attribute_t *mechanismAttributesProvidedList(mechanism m);

void mechanismLoadAttributesRequiredList(mechanism m, uint32_t *b, uint32_t len);
#endif
