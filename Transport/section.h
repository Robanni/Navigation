#ifndef SECTION_H
#define SECTION_H

#include "SupportTypes/PairWrapper.h"
#include "SupportTypes/normalizedfloat.h"

#include <QPair>
#include <QMetaType>

class Section {
    Q_GADGET
    Q_PROPERTY(float value READ GetValueForQml )
    Q_PROPERTY(PairWrapper position READ GetPositionForQml )

public:
    Section() : _value(), _position(false, 0) {}
    explicit Section(QPair<bool, int> position)
        : _position(position) {}

private:
    NormalizedFloat _value;
    QPair<bool, int> _position;

public:
    float GetValue()
    {
        return _value.GetValue();
    }

    float GetValueForQml()
    {
        return _value.GetValue();
    }


    QPair<bool, int> GetSectionPosition()
    {
        return _position;
    }

    PairWrapper GetPositionForQml() const
    {
        return PairWrapper(_position);  // Возвращаем обертку для QML
    }


    void SetValue(float value)
    {
        _value.SetValue(value);
    }
};


Q_DECLARE_METATYPE(Section)

#endif // SECTION_H
