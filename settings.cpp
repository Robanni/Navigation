#include "settings.h"

Settings::Settings(QObject *parent)
    : QObject(parent)
{

    map = new QMap<QString, QString>;
    settings = new QSettings(QSettings::IniFormat,QSettings::UserScope,"RIF","app",this);

    keys = settings->allKeys();

    for(int i = 0; i<keys.length(); i++){
        map->insert(keys[i],settings->value(keys[i]).toString());
    }

}


Settings::~Settings()
{
    keys = map->keys();
    for(int i = 0; i<keys.length(); i++){
        settings->setValue(keys[i],map->value(keys[i]));
    }
}

void Settings::write(QString key, QString value)
{
    map->insert(key,value);
}

QString Settings::read(QString key)
{
    return map->value(key);
}
