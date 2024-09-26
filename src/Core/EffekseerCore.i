%module EffekseerCore

%{

#include "EffekseerBackendCore.h"
#include "EffekseerEffectCore.h"
#include "EffekseerManagerCore.h"

%}

%include "stdint.i"

#if SWIGJAVA
%include "char16.i"
%include various.i
%apply char *BYTE { char* data };

#endif

%include "EffekseerBackendCore.h"
%include "EffekseerEffectCore.h"
%include "EffekseerManagerCore.h"

