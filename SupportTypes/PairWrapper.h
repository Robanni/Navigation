#ifndef PAIRWRAPPER_H
#define PAIRWRAPPER_H

#include <QMetaType>
#include <QPair>

class PairWrapper {
    Q_GADGET
    Q_PROPERTY(bool first MEMBER first)
    Q_PROPERTY(int second MEMBER second)

public:
    bool first;
    int second;

    PairWrapper() : first(false), second(0) {}
    PairWrapper(QPair<bool, int> pair) : first(pair.first), second(pair.second) {}
    QPair<bool, int> toQPair() const {
        return QPair<bool, int>(first, second);
    }
};

Q_DECLARE_METATYPE(PairWrapper)

#endif // PAIRWRAPPER_H
