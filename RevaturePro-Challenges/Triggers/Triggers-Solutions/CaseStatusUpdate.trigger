trigger CaseStatusUpdate on Case (before insert, before update) {
    for (Case c : Trigger.new) {
        if (Trigger.isInsert && c.Status != 'New') {
            c.Status = 'New';
        }
        if (Trigger.isUpdate && c.Internal_Comments__c != Trigger.oldMap.get(c.Id).Internal_Comments__c) {
            if (c.Status == 'New') {
                c.Status = 'Working';
            }
        }
    }
}
