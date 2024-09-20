#ifndef SECTION_H
#define SECTION_H

#include "SupportTypes/normalizedfloat.h"
#include <QPair>


class Section
{
public:

   Section(QPair<bool,int> position);

private:
    NormalizedFloat _value;
    QPair<bool,int> _position;

public:

    float GetValue();
    QPair<bool,int> GetSectionPosition();// left == false; right == true

    void SetValue(float value);

};

#endif // SECTION_H
