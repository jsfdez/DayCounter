import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4

Rectangle {
    id: root
    property alias remainingTime: text.text
    property alias selectedDay: calendar.selectedDate
    property alias minimumDate: calendar.minimumDate
    property alias selectImageButton: selectImageButton
    property alias saveImageButton: saveImageButton
    property alias selectedImageSource: image.source
    property alias image: image

    width: height * 2

    height: 360

    Image {
        id: image
        width: root.height
        sourceSize.width: root.height
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        fillMode: Image.PreserveAspectCrop

        Drag.active: mouseArea.drag.active

        Text {
            id: text
            color: "#bfffe600"
            text: "-1d"
            font.bold: true
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            style: Text.Outline
            styleColor: "#000000"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 128
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: image
        drag.target: image
    }

    Calendar {
        id: calendar
        x: 366
        y: 8
        weekNumbersVisible: true
    }

    Row {
        id: row
        x: 412
        y: 264
        spacing: calendar.y
        width: childrenRect.width
        height: childrenRect.height

        Button {
            id: selectImageButton
            text: qsTr("Select &image")
        }

        Button {
            id: saveImageButton
            text: qsTr("&Save Image")
        }
    }
}
