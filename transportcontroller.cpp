#include "transportcontroller.h"

TransportController::TransportController(QVector<Section> sections, QObject *parent)
    : QObject{parent}
{
    _sections =  sections;

    _stepOfDisabling = 1.f/_sections.count();
    qDebug()<<_stepOfDisabling;
}

void TransportController::EnableAllSections(bool left)
{
    for (auto& section : _sections)
    {
        if(left == section.GetSectionPosition().first)section.SetValue(1);
    }
}

void TransportController::DisableAllSectionsBefore(bool left,int pos)
{

}

void TransportController::SendPercentageOfApproach(bool left, float percent)
{
    if(qIsNaN(percent)||percent<0.01f||percent>1) return;

    //    qDebug() << "position:" << (left ? "left" : "right");
    //    qDebug()<<"percent:"<<percent;

    for (auto& section : _sections)
    {
        auto position = section.GetSectionPosition();
        if(position.first != left) continue;

        auto cof = 1 - (_stepOfDisabling + 2 * _stepOfDisabling * position.second);

        if(percent <= cof) section.SetValue(0);
        else if(percent >= cof && position.second == 0)EnableAllSections(left);
        else section.SetValue(1);

        //        qDebug()<<"Position "<<section.GetSectionPosition();
        //        qDebug()<<"status: "<<section.GetValue();
    }


}

QVector<Section> TransportController::GetSections()
{
    return _sections;
}
