#include "section.h"

Section::Section(QPair<bool, int> position)
{
    _position = position;
}

float Section::GetValue()
{
    return _value.GetValue();
}

QPair<bool, int> Section::GetSectionPosition()
{
    return _position;
}

void Section::SetValue(float value)
{
    _value.SetValue(value);
}



