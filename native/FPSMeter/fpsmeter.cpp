#include "fpsmeter.h"

#include <QDateTime>

FPSMeter::FPSMeter(QQuickItem *parent): QQuickItem(parent), _currentFPS(0), _cacheCount(0)
{
    _times.clear();
    setFlag(QQuickItem::ItemHasContents);
}

FPSMeter::~FPSMeter()
{
}

void FPSMeter::recalculateFPS()
{
    qint64 currentTime = QDateTime::currentDateTime().toMSecsSinceEpoch();
    _times.push_back(currentTime);

    while (_times[0] < currentTime - 1000) {
        _times.pop_front();
    }

    int currentCount = _times.length();
    _currentFPS = (currentCount + _cacheCount) / 2;

    if (currentCount != _cacheCount) emit fpsChanged(_currentFPS);

    _cacheCount = currentCount;

    update();
}

int FPSMeter::fps()const
{
    return _currentFPS;
}

QSGNode *FPSMeter::updatePaintNode(QSGNode *, UpdatePaintNodeData *)
{
    recalculateFPS();
    return nullptr;
}
