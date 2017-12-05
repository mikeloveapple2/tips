import QtQuick 2.0

Rectangle {
    id                    : root
    property alias text   : label.text
    property alias font   : label.font
    property var textColor : "black"
    property var   textPressColor : textColor

    signal clicked
    signal pressed
    signal released

    width  : 60
    height : 60
    color  : "transparent"
    clip   : true
    radius : 8
    border.width: 2
    border.color:  m_mouseArea.pressed ?  textPressColor : textColor

    MouseArea {
        id           : m_mouseArea
        anchors.fill : parent
        onClicked    : {
            root.clicked()
        }
        onPressed:
        {
            root.pressed()
        }
        onReleased:
        {
            root.released()
        }
    }

    Text {
        id                  : label
        text                : "1"
        verticalAlignment   : Text.AlignVCenter
        horizontalAlignment : Text.AlignHCenter
        font.pointSize      : 24
        anchors.centerIn:  parent
        color : m_mouseArea.pressed ?  textPressColor : textColor
    }
}
