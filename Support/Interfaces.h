#ifndef INTERFACES_H
#define INTERFACES_H

class IGetNavigationData
{
protected:
    virtual ~IGetNavigationData() = default;

public:
    virtual void SetCoordinates(double lat,double lng,double rotation) = 0;
};

#endif // INTERFACES_H
