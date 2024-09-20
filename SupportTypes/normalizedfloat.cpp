#include "normalizedfloat.h"

NormalizedFloat::NormalizedFloat()
{

}

NormalizedFloat::~NormalizedFloat()
{

}

float NormalizedFloat::GetValue()
{
    return _value;
}

void NormalizedFloat::SetValue(float value)
{
    if(value<0||value>1) return;
    else _value = value;
}
