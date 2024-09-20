#ifndef TRANSPORTCONTROLLER_H
#define TRANSPORTCONTROLLER_H

#include "Transport/section.h"
#include <QObject>
#include <QVector>
#include <QDebug>

class TransportController : public QObject
{
    Q_OBJECT
public:
    explicit TransportController(QVector<Section> sections, QObject *parent = nullptr);

private:
    QVector<Section> _sections;

    float _stepOfDisabling = 0.1;

private:
    void EnableAllSections(bool left);
    void DisableAllSectionsBefore(bool left,int pos);

public:
    void SendPercentageOfApproach(bool left, float percent);
    QVector<Section> GetSections();

};

#endif // TRANSPORTCONTROLLER_H
