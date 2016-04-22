import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Traffic Light")

    property int index: 0
    Settings
    {
        id: settings_global
        property alias gstate: g.running
        property alias ystate: y.running
        property alias rstate: r.running
    }

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Rectangle
        {
            id: rect_traffic_light_head
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter

            height: parent.height * .9;
            width: parent.width/3;
            border.color: "brown"

            //property bool isRunning: false

            Timer {
                id:r
                interval: 2000; running: false; repeat: false
                onTriggered: {
                    rect_yellow_light.color = "black"
                    rect_red_light.color = "red"
                    g.start()
                }
            }
            Timer {
                id:y
                interval: 2000; running: false; repeat: false
                onTriggered: {
                    rect_green_light.color = "black"
                    rect_yellow_light.color = "yellow"
                    r.start()
                }
            }
            Timer {
                id:g
                interval: 2000; running: true; repeat: false
                onTriggered: {
                    rect_red_light.color = "black"
                    rect_green_light.color = "green"
                    y.start()
                }
            }

            Rectangle
            {
                id: rect_red_light
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.width: 10
                border.color: "black"
                color: "black"
            }

            Rectangle
            {
                id: rect_yellow_light
                anchors.top: rect_red_light.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.width: 10
                border.color: "black"
                color: "black"
            }

            Rectangle
            {
                id: rect_green_light
                anchors.top: rect_yellow_light.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.color: "black"
                border.width: 10
                color: "black"
            }
        }
    }
}
