import QtQuick 2.0

Rectangle { 
    id : root
    width : 120
    height : 40
    color : "transparent"
    clip : true

    property alias txtColor : txt.color
    property alias font     : txt.font
    property alias text     : txt.text
    property var   placeholderText : ""

    signal clicked();

    Text {
        id : txt
        color: "#e72626"
        text: "Hello This is Robert speaking"
        font.pointSize: 13
        verticalAlignment   : Text.AlignVCenter
        horizontalAlignment : Text.AlignLeft

        anchors {
            fill : parent
            margins : 2
        }
    }

    Text {
        id :placeHoder
        anchors.fill:  parent
        color : "gray"
        visible:  parent.text.length == 0
        text : root.placeholderText
        font.pointSize: 13
        verticalAlignment   : Text.AlignVCenter
        horizontalAlignment : Text.AlignLeft
    }

    border {
        color : "black"
    }

    MouseArea {
        anchors.fill:  parent
        onClicked : {
            root.clicked();
        }
    }
}


