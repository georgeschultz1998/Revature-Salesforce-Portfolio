trigger AccountTrigger on Account (before insert, before delete) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            AccountTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        when BEFORE_DELETE {
            AccountTriggerHandler.handleBeforeDelete(Trigger.oldMap);
        }
    }
}
