import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id : root
    width : 280
    height : 360
    color : "#E0E0E0"

    signal keyPressed(var keyValue);
    signal clearPressed();
    signal enterPressed();
    signal backspacePressed();

    GridLayout {
        id : grid
        columns: 4
        rowSpacing: 5
        columnSpacing: 4

        anchors.fill:  parent
        anchors.margins:  5

        NumberButton{ textPressColor : "#DD2C00"; text : "7";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "8";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "9";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "C";  onClicked: { numberPressHandle("clear");} height: 150; Layout.rowSpan: 2; }

        NumberButton{ textPressColor : "#dd2c00"; text : "4";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "5";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "6";  onClicked: { numberPressHandle(text);}    }

        NumberButton{ textPressColor : "#dd2c00"; text : "1";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "2";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "3";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "↲";  onClicked: { numberPressHandle("enter");} Layout.rowSpan: 2; height: 150;  }

        NumberButton{ textPressColor : "#dd2c00"; text : "0";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : ".";  onClicked: { numberPressHandle(text);}    }
        NumberButton{ textPressColor : "#dd2c00"; text : "←";  onClicked: { numberPressHandle("backspace");}  }

    }


    function numberPressHandle(keyValue){
        switch(keyValue){
        case "enter" : {
            root.enterPressed();
            break;
        }
        case "backspace" : {
            root.backspacePressed();
            break;
        }
        case "clear" : {
            root.clearPressed();
            break;
        }
        default : {
            root.keyPressed(keyValue);
            break;
        }
        }
    }
}
