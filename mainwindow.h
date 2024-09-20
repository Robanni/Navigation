#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QWidget>
#include <QSettings>
#include <QQuickWidget>

class MainWindow : public QWidget
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public:
    QQuickWidget* rootWidget;

private:
    QQuickWidget *pQWid;
};
#endif // MAINWINDOW_H
