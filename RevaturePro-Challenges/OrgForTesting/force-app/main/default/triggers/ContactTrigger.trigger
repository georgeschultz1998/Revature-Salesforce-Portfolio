trigger ContactTrigger on Contact (before insert, before update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            ContactTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            ContactTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}
