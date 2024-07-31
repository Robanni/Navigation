QT += quick location

SOURCES += \
        main.cpp \
        maphandler.cpp \
        navigationcontroller.cpp \
        transportcontroller.cpp

resources.files = main.qml
resources.prefix = /$${TARGET}
RESOURCES += resources \
    src.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    KeyboardInputStub.h \
    Support/Interfaces.h \
    Support/SupportFunctions.h \
    Support/SupportStructers.h \
    maphandler.h \
    navigationcontroller.h \
    transportcontroller.h

DISTFILES +=
