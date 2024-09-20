#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QWidget(parent)
{
    rootWidget = new QQuickWidget(QUrl("qrc:/QML/MainWindow.qml"),this);
}

MainWindow::~MainWindow() {}



