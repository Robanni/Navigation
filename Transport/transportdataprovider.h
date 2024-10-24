#ifndef TRANSPORTDATAPROVIDER_H
#define TRANSPORTDATAPROVIDER_H

#include <QObject>
#include <Support/SupportStructers.h>

class TransportDataProvider : public QObject
{
    Q_OBJECT
public:
    explicit TransportDataProvider(QObject *parent = nullptr);

public:
    void resiveTransportData(TransportData data);

private:
    TransportData _transportData;

signals:
    void transportDataResived(TransportData);
};

#endif // TRANSPORTDATAPROVIDER_H
