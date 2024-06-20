({
    doInit: function(component, event, helper) {
        component.set("v.messages", []);
    },
    
    handleReceive: function(component, event, helper) {
        var message = event.getParam("value");
        var messages = component.get("v.messages");
        messages.push(message);
        component.set("v.messages", messages);
    },
    
    clearChildInput: function(component, event, helper) {
        var childCmp = component.find("childCmp");
        childCmp.clearInput();
    }
})
