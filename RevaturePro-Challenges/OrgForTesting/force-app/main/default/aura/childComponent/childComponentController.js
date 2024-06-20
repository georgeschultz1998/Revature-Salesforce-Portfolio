({
    handleSend: function(component, event, helper) {
        var inputValue = component.get("v.inputValue");
        var sendValueEvent = component.getEvent("sendValue");
        sendValueEvent.setParams({ "value": inputValue });
        sendValueEvent.fire();
    },
    
    clearInput: function(component, event, helper) {
        component.set("v.inputValue", "");
        component.find("inputBox").set("v.value", "");
    }
})
