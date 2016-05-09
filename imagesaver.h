#ifndef IMAGESAVER_H
#define IMAGESAVER_H

#include <QObject>

class QQuickItem;
class QQuickItemGrabResult;

class ImageSaver : public QObject
{
    Q_OBJECT
public:
    explicit ImageSaver(QObject *parent = 0);

public slots:
    void saveImage(QQuickItem *item, const QString &fileName);

private slots:
    void imageGrabbed(QSharedPointer<QQuickItemGrabResult> result, const QString &fileName);
};

#endif // IMAGESAVER_H
