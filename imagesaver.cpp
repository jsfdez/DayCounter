#include "imagesaver.h"

#include <QImage>
#include <QQuickItem>
#include <QQuickItemGrabResult>

#include <functional>

ImageSaver::ImageSaver(QObject *parent) : QObject(parent)
{}

void ImageSaver::saveImage(QQuickItem *item, const QString &fileName)
{
    auto result = item->grabToImage(QSize{ static_cast<int>(item->width()),
                                           static_cast<int>(item->height()) });
    connect(result.data(), &QQuickItemGrabResult::ready, std::bind(&ImageSaver::imageGrabbed, this,
                                                                   result, fileName));
}

void ImageSaver::imageGrabbed(QSharedPointer<QQuickItemGrabResult> result, const QString &fileName)
{
    QUrl url(fileName);
    if (result->image().save(url.toLocalFile()))
        qDebug() << fileName << "wrote successfully";
    else
        qCritical() << "Error writing" << fileName;
}
