QT       += core gui
QT       += quick qml widgets quickwidgets
QML_IMPORT_PATH += C:/Qt/6.2.0/mingw81_64/qml
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    parametrsstorage.cpp \
    settings.cpp

HEADERS += \
    ISettingsControl.h \
    mainwindow.h \
    parametrsstorage.h \
    settings.h

# Default rules for deployment.

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    Resources.qrc
