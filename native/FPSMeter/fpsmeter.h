#ifndef FPSMETER_H
#define FPSMETER_H

#include <QQuickItem>

class FPSMeter: public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(int fps READ fps NOTIFY fpsChanged)
public:
    FPSMeter(QQuickItem *parent = 0);
    ~FPSMeter();
    Q_INVOKABLE int fps()const;

protected:
    virtual QSGNode* updatePaintNode(QSGNode*, UpdatePaintNodeData*) override;
    
signals:
    void fpsChanged(int);

private:
    void recalculateFPS();
    int _currentFPS;
    int _cacheCount;
    QVector<qint64> _times;
};

#endif // FPSMETER_H
