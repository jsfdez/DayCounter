import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml 2.0
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.0

Window {
    id: root
    property date currentDate: new Date()
    property int daysRemaining: (form.selectedDay - currentDate) / 1000 / 3600 / 24 + 1

    width: form.width
    height: form.height
    visible: true

    Settings {
        id: settings
        property alias selectedDay: form.selectedDay
    }

    FileDialog {
        id: selectImageFileDialog
        title: qsTr("Select the image file")
        folder: shortcuts.pictures
        nameFilters: [ "Image files (*.jpg *.png)" ]
        onAccepted: {
            form.selectedImageSource = selectImageFileDialog.fileUrl
        }
    }

    FileDialog {
        id: saveImageFileDialog
        title: qsTr("Select the image file")
        folder: shortcuts.pictures
        nameFilters: [ "PNG file (*.png)", "JPG file (*.jpg)" ]
        selectExisting: false
        onAccepted: {
            imageSaver.saveImage(form.image, saveImageFileDialog.fileUrl)
        }
    }

    MainForm {
        id: form
        minimumDate: currentDate
        remainingTime: daysRemaining > 31 ? (Math.floor(daysRemaining / 7) + "w") :
                                            (daysRemaining + "d")

        selectImageButton.onClicked: selectImageFileDialog.open()
        saveImageButton.onClicked: saveImageFileDialog.open()
    }
}
