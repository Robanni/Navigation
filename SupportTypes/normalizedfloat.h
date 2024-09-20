#ifndef NORMALIZEDFLOAT_H
#define NORMALIZEDFLOAT_H


#include <QMetaType>

class NormalizedFloat
{
    Q_GADGET
    Q_PROPERTY(float value READ GetValue )

public:
    NormalizedFloat() : _value(0.0f) {}
    ~NormalizedFloat() = default;

private:
    float _value = 0.0f;

public:
    float GetValue()
    {
        return _value;
    }
    void  SetValue(float value)
    {
        if(value<0||value>1) return;
        else _value = value;
    }


};

Q_DECLARE_METATYPE(NormalizedFloat)
#endif // NORMALIZEDFLOAT_H
