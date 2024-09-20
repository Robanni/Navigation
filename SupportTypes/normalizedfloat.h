#ifndef NORMALIZEDFLOAT_H
#define NORMALIZEDFLOAT_H


class NormalizedFloat
{
public:
    NormalizedFloat();
    ~NormalizedFloat();

private:
    float _value = 0;

public:
    float GetValue();
    void  SetValue(float value);


};
#endif // NORMALIZEDFLOAT_H
