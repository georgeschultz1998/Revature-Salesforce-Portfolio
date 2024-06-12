trigger CreateRelatedContactOnAccountInsert on Account (after insert) {
    List<Contact> contactsToCreate = new List<Contact>();
    for (Account acc : Trigger.new) {
        contactsToCreate.add(new Contact(LastName = acc.Name + ' Contact', AccountId = acc.Id));
    }
    if (!contactsToCreate.isEmpty()) {
        insert contactsToCreate;
    }
}
