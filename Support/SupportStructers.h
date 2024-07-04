#ifndef SUPPORTSTRUCTERS_H
#define SUPPORTSTRUCTERS_H

struct NmeaData
{
    int time = 0;
    double latitude = 0;
    double longitude = 0;
    double speed = 0;
    double altitude = 0;
    double course = 0;
    int satellites = 0;
    bool timeEquality = false;
};

#endif // SUPPORTSTRUCTERS_H
