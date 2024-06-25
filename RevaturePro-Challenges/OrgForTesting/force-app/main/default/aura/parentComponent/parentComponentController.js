({
    doInit: function(component, event, helper) {
        helper.initializeMessages(component);
    },
    
    handleReceive: function(component, event, helper) {
        helper.receiveMessage(component, event);
    },
    
    clearChildInput: function(component, event, helper) {
        helper.clearChildInputField(component);
    }
})
