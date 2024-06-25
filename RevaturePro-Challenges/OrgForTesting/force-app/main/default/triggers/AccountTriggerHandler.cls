public class AccountTriggerHandler {
    
    public static void handleBeforeInsert(List<Account> newAccounts) {
        createRelatedContacts(newAccounts);
    }

    public static void handleBeforeDelete(Map<Id, Account> oldAccountsMap) {
        preventDeletionWithContacts(oldAccountsMap);
    }

    private static void createRelatedContacts(List<Account> newAccounts) {
        List<Contact> contactsToCreate = new List<Contact>();
        for (Account acc : newAccounts) {
            contactsToCreate.add(new Contact(
                LastName = acc.Name,
                AccountId = acc.Id
            ));
        }
        if (!contactsToCreate.isEmpty()) {
            insert contactsToCreate;
        }
    }

    private static void preventDeletionWithContacts(Map<Id, Account> oldAccountsMap) {
        for (Account acc : oldAccountsMap.values()) {
            Integer contactCount = [SELECT COUNT() FROM Contact WHERE AccountId = :acc.Id];
            if (contactCount > 0) {
                acc.addError('Cannot delete account with related contacts.');
            }
        }
    }
}
