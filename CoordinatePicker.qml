import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6

Rectangle { 
    id     : root
    width  : 480
    height : 360
    color  : "beige"

    signal getCoordinate(var coordinate);

    Plugin { 
        id   : osmPlugin
        name : "osm"
    }
    Map {
        id           : map
        center       : QtPositioning.coordinate( 22.2797546080,113.5849481821 )
        plugin       : osmPlugin
        zoomLevel    : 10
        anchors.fill : parent

        MouseArea {
            id           : ma_map
            anchors.fill : parent

            onClicked : {
                var point = Qt.point(mouse.x, mouse.y);
                var coord = map.toCoordinate(point, false);
                txt_coord.text =  coord.latitude + ", " + coord.longitude;
                root.getCoordinate(coord);
            }
        }
    }

    Rectangle {
        id     : rectangle1
        width  : parent.width
        height : 70
        color  : "#7fcccccc"

        Text {
            id                  : txt_coord
            text                : "0,0"
            color               : "red"
            verticalAlignment   : Text.AlignVCenter
            horizontalAlignment : Text.AlignHCenter
            font.pixelSize      : 15
            anchors.centerIn    : parent
        }
    }


}
