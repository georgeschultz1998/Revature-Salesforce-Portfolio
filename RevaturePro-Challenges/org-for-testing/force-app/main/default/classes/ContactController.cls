public with sharing class ContactController {
    @AuraEnabled
    public static void createContact(Contact contact) {
        try {
            System.debug('Creating contact: ' + contact);
            insert contact;
            System.debug('Contact created successfully');
        } catch (Exception e) {
            System.debug('Error creating contact: ' + e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }
}
