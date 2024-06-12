trigger UpdateCaseStatusOnInternalComments on Case (before insert, before update) {
    for (Case c : Trigger.new) {
        if (c.Status == null) {
            c.Status = 'New';
        } else if (c.Status == 'New' && c.Internal_Comments__c != Trigger.oldMap.get(c.Id).Internal_Comments__c) {
            c.Status = 'Working';
        }
    }
}
