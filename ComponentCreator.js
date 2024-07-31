var component;
var PolylineReapeater;

function createPolylineRepeaterObjects(parent) {
    component = Qt.createComponent("PolylineRepeater.qml");
    if (component.status === Component.Ready)
        finishCreation(parent);
    else
        component.statusChanged.connect(finishCreation(parent));
}

function finishCreation(parent) {
    if (component.status === Component.Ready) {
        PolylineReapeater = component.createObject(parent,{sectionCount:10});
        if (PolylineReapeater === null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
