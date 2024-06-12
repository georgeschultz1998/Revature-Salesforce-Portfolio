trigger AccountPreventDeletion on Account (before delete) {
    for (Account acc : Trigger.old) {
        if ([SELECT Id FROM Contact WHERE AccountId = :acc.Id LIMIT 1].size() > 0) {
            acc.addError('Cannot delete Account with related Contacts.');
        }
    }
}
