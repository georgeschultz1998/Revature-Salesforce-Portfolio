({
    sendMessage: function(component) {
        var inputValue = component.get("v.inputValue");
        var sendValueEvent = component.getEvent("sendValue");
        sendValueEvent.setParams({ "value": inputValue });
        sendValueEvent.fire();
    },

    clearInputField: function(component) {
        component.set("v.inputValue", "");
        component.find("inputBox").set("v.value", "");
    }
})
