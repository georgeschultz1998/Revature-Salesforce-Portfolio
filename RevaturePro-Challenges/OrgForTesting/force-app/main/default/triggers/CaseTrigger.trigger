trigger CaseTrigger on Case (before insert, before update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            CaseTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            CaseTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}
