public with sharing class ContactController {
    @AuraEnabled
    public static Id createContact(Contact contact) {
        insert contact;
        return contact.Id;
    }
}
