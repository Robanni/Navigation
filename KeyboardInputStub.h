#ifndef KEYBOARDINPUTSTUB_H
#define KEYBOARDINPUTSTUB_H

#include "Support/Interfaces.h"

#include <QObject>
#include <QEvent>
#include <QKeyEvent>
#include <QDebug>

class KeyboardInputStub: public QObject
{
    Q_OBJECT
public:
    explicit KeyboardInputStub(IGetNavigationData* inputer,QObject *parent = nullptr): QObject{parent}
    {
        _dataInputer = inputer;
        _dataInputer->SetCoordinates(_lat,_lng,_rotation);
    };

private:
    IGetNavigationData* _dataInputer;

private:
    double _lat = 51.6700;
    double _lng = 39.2000;
    double _rotation = 0;
    double _step = 0.000005;
    double _rotationStep = 1;


    // QObject interface
public:
    bool eventFilter(QObject *object, QEvent *event) override
    {
        if (event->type() == QEvent::KeyPress) {

            QKeyEvent *ke = static_cast<QKeyEvent *>(event);

            switch(ke->key())
            {
            case(Qt::Key_Up):
                _lat += _step * cos(_rotation * M_PI / 180);
                _lng += _step * sin(_rotation * M_PI / 180);
                break;
            case(Qt::Key_Down):
                _lat -= _step * cos(_rotation * M_PI / 180);
                _lng -= _step * sin(_rotation * M_PI / 180);
                break;
            case(Qt::Key_Right):
                _rotation += _rotationStep;
                break;
            case(Qt::Key_Left):
                _rotation -= _rotationStep;
                break;
            }

            _dataInputer->SetCoordinates(_lat,_lng,_rotation);
            return true;
        }
        return QObject::eventFilter(object, event);
    }
};

#endif // KEYBOARDINPUTSTUB_H
