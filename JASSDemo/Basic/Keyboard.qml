import QtQuick

Item {
    id: root

    signal keyPressed(int index)
    signal keyReleased(int index)

    property color keyColor: "ivory"

    property int keyCount: 12
    MultiPointTouchArea {
        function keyIndex(key) {
            let index = 0;
            for (; index < keys.children.length - 1; ++index)
                if (keys.children[index] === key)
                    return index;
            return -1;
        }
        function scanKeyPress(touchPoints) {
            for (let point of touchPoints) {
                let child = keys.childAt(point.x, point.y)
                const index = keyIndex(child)
                if (index === -1)
                    return
                root.keyPressed(index)
                keys.children[index].state = "pressed"
            }
        }
        function scanKeyRelease(touchPoints) {
            for (let point of touchPoints) {
                let child = keys.childAt(point.x, point.y)
                const index = keyIndex(child)
                if (index === -1)
                    return
                root.keyReleased(index)
                keys.children[index].state = "released"
            }
        }
        function scanKeyUpdate(touchPoints) {
            for (let i = 0; i < keys.children.length-1; ++i) {
                let child = keys.children[i]
                let containsPoint = false
                for (let point of touchPoints) {
                    const mapped = child.mapFromItem(root, point.x, point.y)
                    if (child.contains(Qt.point(mapped.x, mapped.y)))
                        containsPoint = true
                }
                if (containsPoint) {
                    root.keyPressed(i)
                    child.state = "pressed"
                }
                else {
                    root.keyReleased(i)
                    child.state = "released"
                }
            }
        }

        anchors.fill: parent
        maximumTouchPoints: 10
        onPressed: function(touchPoints) {scanKeyPress(touchPoints)}
        onReleased: function(touchPoints) {scanKeyRelease(touchPoints)}
        onUpdated: function(touchPoints) {scanKeyUpdate(touchPoints)}
    }

    Row {
        id: keys
        Repeater {
            id: rep
            model: root.keyCount
            BasicKey {
                id: key
                width: root.width/keyCount
                height: root.height
                baseColor: root.keyColor
                onPressed: root.keyPressed(index)
                onReleased: root.keyReleased(index)
            }
        }
    }

}
