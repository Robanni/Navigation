#ifndef NAVIGATIONCONTROLLER_H
#define NAVIGATIONCONTROLLER_H

#include <QObject>
#include <QPointF>

class NavigationController : public QObject
{
    Q_OBJECT
public:
    explicit NavigationController(QObject *parent = nullptr);

private:
    float _latitude = 1;
    float _longitude = 1;
    float _rotation = 0;

    std::vector<QPointF> points;
    int i = 0;

public:
    QPointF GetPosition();
    float GetRotation();

};

#endif // NAVIGATIONCONTROLLER_H
