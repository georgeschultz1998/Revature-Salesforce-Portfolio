@isTest
public class AccountFilterControllerTest {
    @isTest
    static void testApplyFilter() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Contact testContact = new Contact(LastName = 'Test Contact', AccountId = testAccount.Id);
        insert testContact;

        // Test controller
        AccountFilterController controller = new AccountFilterController();
        controller.filter = 'Test';
        controller.applyFilter();

        // Verify results
        System.assertEquals(1, controller.filteredAccounts.size());
        System.assertEquals('Test Account', controller.filteredAccounts[0].Name);
    }
}
