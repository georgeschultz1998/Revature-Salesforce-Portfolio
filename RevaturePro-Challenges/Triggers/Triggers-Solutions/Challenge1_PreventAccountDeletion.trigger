trigger PreventAccountDeletion on Account (before delete) {
    for (Account acc : Trigger.old) {
        if ([SELECT Id FROM Contact WHERE AccountId = :acc.Id LIMIT 1].size() > 0) {
            acc.addError('You cannot delete an Account that has related Contacts.');
        }
    }
}
