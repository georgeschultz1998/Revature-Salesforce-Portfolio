trigger AccountCreateContact on Account (after insert) {
    List<Contact> contacts = new List<Contact>();
    for (Account acc : Trigger.new) {
        contacts.add(new Contact(LastName = acc.Name + ' Contact', AccountId = acc.Id));
    }
    if (!contacts.isEmpty()) {
        insert contacts;
    }
}
