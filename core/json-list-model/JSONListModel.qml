/* JSONListModel - a QML ListModel with JSON and JSONPath support */

import QtQuick 2.0
import QtQml 2.12
import QtQuick.Controls 2.5
import "jsonpath.js" as JSONPath

Item {
    id: listModel
    property string source: ""
    property string json: ""
    property string query: ""
    property var msgHanndler: function(src) {  }

    property ListModel model : ListModel { id: jsonModel }
    property alias count: jsonModel.count

//    Connections {
//        target: translator

//        function onSignalTranslated() {
//            jsonChanged()
//            sourceChanged()
//        }
//    }

    onSourceChanged: {
//        var xhr = new XMLHttpRequest;
//        xhr.open("GET", source);
//        xhr.onreadystatechange = function() {
//            if (xhr.readyState === XMLHttpRequest.DONE)
//            {
//                json = xhr.responseText;
//            }
//        }
//        xhr.send();

        json = source;
    }

    onJsonChanged: {
        updateJSONModel()
        msgHanndler(listModel.json)
    }
    onQueryChanged: updateJSONModel()

    function updateJSONModel() {
        jsonModel.clear();

        if ( json === "" )
            return;

        var objectArray = parseJSONString(json, query);
        for ( var key in objectArray ) {
            var jo = objectArray[key];
            jsonModel.append( jo );
        }
    }

    function parseJSONString(jsonString, jsonPathQuery) {
        var objectArray = JSON.parse(jsonString);
        if ( jsonPathQuery !== "" )
            objectArray = JSONPath.jsonPath(objectArray, jsonPathQuery);
        return objectArray;
    }
}
