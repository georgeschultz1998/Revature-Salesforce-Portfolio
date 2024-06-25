trigger OrderTrigger on Order (before insert) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            OrderTriggerHandler.handleBeforeInsert(Trigger.new);
        }
    }
}