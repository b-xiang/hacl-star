/* This file was auto-generated by KreMLin! */

#include "PKCS11_Attribute.h"

uint32_t attributeGetTypeID(attribute_t a)
{
  if (a.tag == CKA_CLASS)
  {
    uint32_t identifier = a.case_CKA_CLASS.typeId;
    return identifier;
  }
  else if (a.tag == CKA_TOKEN)
  {
    uint32_t identifier = a.case_CKA_TOKEN.typeId;
    return identifier;
  }
  else if (a.tag == CKA_PRIVATE)
  {
    uint32_t identifier = a.case_CKA_PRIVATE.typeId;
    return identifier;
  }
  else if (a.tag == CKA_LABEL)
  {
    uint32_t identifier = a.case_CKA_LABEL.typeId;
    return identifier;
  }
  else if (a.tag == CKA_APPLICATION)
  {
    uint32_t identifier = a.case_CKA_APPLICATION.typeId;
    return identifier;
  }
  else if (a.tag == CKA_VALUE)
  {
    uint32_t identifier = a.case_CKA_VALUE.typeId;
    return identifier;
  }
  else if (a.tag == CKA_OBJECT_ID)
  {
    uint32_t identifier = a.case_CKA_OBJECT_ID.typeId;
    return identifier;
  }
  else if (a.tag == CKA_CERTIFICATE_TYPE)
  {
    uint32_t identifier = a.case_CKA_CERTIFICATE_TYPE.typeId;
    return identifier;
  }
  else if (a.tag == CKA_ISSUER)
  {
    uint32_t identifier = a.case_CKA_ISSUER.typeId;
    return identifier;
  }
  else if (a.tag == CKA_SERIAL_NUMBER)
  {
    uint32_t identifier = a.case_CKA_SERIAL_NUMBER.typeId;
    return identifier;
  }
  else if (a.tag == CKA_KEY_TYPE)
  {
    uint32_t identifier = a.case_CKA_KEY_TYPE.typeId;
    return identifier;
  }
  else if (a.tag == CKA_ID)
  {
    uint32_t identifier = a.case_CKA_ID.typeId;
    return identifier;
  }
  else if (a.tag == CKA_SENSITIVE)
  {
    uint32_t identifier = a.case_CKA_SENSITIVE.typeId;
    return identifier;
  }
  else if (a.tag == CKA_ENCRYPT)
  {
    uint32_t identifier = a.case_CKA_ENCRYPT.typeId;
    return identifier;
  }
  else if (a.tag == CKA_DECRYPT)
  {
    uint32_t identifier = a.case_CKA_DECRYPT.typeId;
    return identifier;
  }
  else if (a.tag == CKA_WRAP)
  {
    uint32_t identifier = a.case_CKA_WRAP.typeId;
    return identifier;
  }
  else if (a.tag == CKA_UNWRAP)
  {
    uint32_t identifier = a.case_CKA_UNWRAP.typeId;
    return identifier;
  }
  else if (a.tag == CKA_SIGN)
  {
    uint32_t identifier = a.case_CKA_SIGN.typeId;
    return identifier;
  }
  else if (a.tag == CKA_VERIFY)
  {
    uint32_t identifier = a.case_CKA_VERIFY.typeId;
    return identifier;
  }
  else
  {
    printf("KreMLin abort at %s:%d\n%s\n", __FILE__, __LINE__, "no else in F*");
    exit(255U);
  }
}

bool attributeGetReadOnly(attribute_t a)
{
  if (a.tag == CKA_CLASS)
  {
    bool readOnly = a.case_CKA_CLASS.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_TOKEN)
  {
    bool readOnly = a.case_CKA_TOKEN.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_PRIVATE)
  {
    bool readOnly = a.case_CKA_PRIVATE.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_LABEL)
  {
    bool readOnly = a.case_CKA_LABEL.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_APPLICATION)
  {
    bool readOnly = a.case_CKA_APPLICATION.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_VALUE)
  {
    bool readOnly = a.case_CKA_VALUE.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_OBJECT_ID)
  {
    bool readOnly = a.case_CKA_OBJECT_ID.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_CERTIFICATE_TYPE)
  {
    bool readOnly = a.case_CKA_CERTIFICATE_TYPE.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_ISSUER)
  {
    bool readOnly = a.case_CKA_ISSUER.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_SERIAL_NUMBER)
  {
    bool readOnly = a.case_CKA_SERIAL_NUMBER.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_KEY_TYPE)
  {
    bool readOnly = a.case_CKA_KEY_TYPE.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_ID)
  {
    bool readOnly = a.case_CKA_ID.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_SENSITIVE)
  {
    bool readOnly = a.case_CKA_SENSITIVE.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_ENCRYPT)
  {
    bool readOnly = a.case_CKA_ENCRYPT.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_DECRYPT)
  {
    bool readOnly = a.case_CKA_DECRYPT.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_WRAP)
  {
    bool readOnly = a.case_CKA_WRAP.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_UNWRAP)
  {
    bool readOnly = a.case_CKA_UNWRAP.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_SIGN)
  {
    bool readOnly = a.case_CKA_SIGN.isReadOnly;
    return readOnly;
  }
  else if (a.tag == CKA_VERIFY)
  {
    bool readOnly = a.case_CKA_VERIFY.isReadOnly;
    return readOnly;
  }
  else
  {
    printf("KreMLin abort at %s:%d\n%s\n", __FILE__, __LINE__, "no else in F*");
    exit(255U);
  }
}

uint32_t attributeRawGetTypeID(_CK_ATTRIBUTE a)
{
  uint32_t typ = a._type;
  return typ;
}

_CK_VOID_PTR attributeRawGetData(_CK_ATTRIBUTE a)
{
  _CK_VOID_PTR pValue = a.pValue;
  return pValue;
}

uint32_t attributeRawGetLength(_CK_ATTRIBUTE a)
{
  uint32_t length1 = a.ulValueLen;
  return length1;
}

bool
_buffer_for_all__PKCS11_TypeDeclaration_attribute_t(
  attribute_t *b,
  uint32_t l,
  bool (*f1)(attribute_t x0),
  uint32_t counter,
  bool tempResult
)
{
  if (counter == l)
    return tempResult;
  else
  {
    attribute_t uu____593 = b[counter];
    bool uu____591 = tempResult && f1(uu____593);
    return
      _buffer_for_all__PKCS11_TypeDeclaration_attribute_t(b,
        l,
        f1,
        counter + (uint32_t)1U,
        uu____591);
  }
}

bool
buffer_for_all__PKCS11_TypeDeclaration_attribute_t(
  attribute_t *b,
  uint32_t l,
  bool (*f1)(attribute_t x0)
)
{
  return _buffer_for_all__PKCS11_TypeDeclaration_attribute_t(b, l, f1, (uint32_t)0U, true);
}

bool attributesForAll(attribute_t *b, uint32_t l, bool (*f1)(attribute_t x0))
{
  return buffer_for_all__PKCS11_TypeDeclaration_attribute_t(b, l, f1);
}

bool attributesForAllSeveralFunctions(attribute_t *b, uint32_t l, bool (**fs)(attribute_t x0))
{
  bool (*f0)(attribute_t x0) = fs[0U];
  bool (*f1)(attribute_t x0) = fs[1U];
  return attributesForAll(b, l, f0) || attributesForAll(b, l, f1);
}

bool attributesIsReadOnly__PKCS11_TypeDeclaration_attribute_t(attribute_t uu___48_478)
{
  return false;
}

bool attributesForAllNotReadOnly(attribute_t *b, uint32_t l)
{
  bool
  uu____796 = attributesForAll(b, l, attributesIsReadOnly__PKCS11_TypeDeclaration_attribute_t);
  return !uu____796;
}

