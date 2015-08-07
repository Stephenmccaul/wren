#include <string.h>

#include "return_null.h"

static void implicitNull(WrenVM* vm)
{
  // Do nothing.
}

WrenForeignMethodFn returnNullBindForeign(const char* signature)
{
  if (strcmp(signature, "static Api.implicitNull") == 0) return implicitNull;

  return NULL;
}
