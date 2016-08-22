import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml 2.0
import QtQuick.Dialogs 1.2

Window {
    id: root
    property date currentDate: new Date()
    property int daysRemaining: (form.selectedDay - currentDate) / 1000 / 3600 / 24 + 1

    width: form.width
    height: form.height
    visible: true

    FileDialog {
        id: selectImageFileDialog
        title: qsTr("Select the image file")
        folder: shortcuts.home
        nameFilters: [ "Image files (*.jpg *.png)" ]
        onAccepted: {
            form.selectedImageSource = selectImageFileDialog.fileUrl
        }
    }

    FileDialog {
        id: saveImageFileDialog
        title: qsTr("Select the image file")
        folder: shortcuts.home
        nameFilters: [ "PNG file (*.png)", "JPG file (*.jpg)" ]
        selectExisting: false
        onAccepted: {
            imageSaver.saveImage(form.image, saveImageFileDialog.fileUrl)
        }
    }

    MainForm {
        id: form
        minimumDate: currentDate
        remainingTime: daysRemaining > 31 ? (Math.floor(daysRemaining / 7) + "w") : (daysRemaining + "d")

        selectImageButton.onClicked: selectImageFileDialog.open()
        saveImageButton.onClicked: saveImageFileDialog.open()
    }
}
