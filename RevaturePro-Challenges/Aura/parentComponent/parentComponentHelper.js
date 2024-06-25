({
    initializeMessages: function(component) {
        component.set("v.messages", []);
    },

    receiveMessage: function(component, event) {
        var message = event.getParam("value");
        var messages = component.get("v.messages");
        messages.push(message);
        component.set("v.messages", messages);
    },

    clearChildInputField: function(component) {
        var childCmp = component.find("childCmp");
        childCmp.clearInput();
    }
})
