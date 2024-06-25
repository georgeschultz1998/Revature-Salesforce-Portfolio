@isTest
public class DataLordTest {

    // Use the @testSetup method to create test data that is shared across test methods
    @testSetup
    static void setupTestData() {
        // Create Accounts
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Hot Account 1', Rating = 'Hot', AnnualRevenue = 1000000),
            new Account(Name = 'Hot Account 2', Rating = 'Hot', AnnualRevenue = 2000000),
            new Account(Name = 'Cold Account', Rating = 'Cold', AnnualRevenue = 300000),
            new Account(Name = 'Complex & Account', Rating = 'Warm', AnnualRevenue = 500000),
            new Account(Name = 'Another & Complex Account', Rating = 'Warm', AnnualRevenue = 700000)
        };
        insert accounts;

        // Create Opportunities
        List<Opportunity> opportunities = new List<Opportunity>{
            new Opportunity(Name = 'Big Opportunity 1', Amount = 150000, CloseDate = Date.today(), StageName = 'Closed Won', AccountId = accounts[0].Id),
            new Opportunity(Name = 'Big Opportunity 2', Amount = 120000, CloseDate = Date.today().addDays(-10), StageName = 'Closed Won', AccountId = accounts[1].Id),
            new Opportunity(Name = 'Small Opportunity', Amount = 90000, CloseDate = Date.today().addDays(-20), StageName = 'Closed Won', AccountId = accounts[2].Id)
        };
        insert opportunities;

        // Create Contacts
        List<Contact> contacts = new List<Contact>{
            new Contact(FirstName = 'John', LastName = 'Doe', AccountId = accounts[0].Id),
            new Contact(FirstName = 'Jane', LastName = 'Doe', AccountId = accounts[0].Id),
            new Contact(FirstName = 'Jim', LastName = 'Beam', AccountId = accounts[1].Id),
            new Contact(FirstName = 'Jack', LastName = 'Daniels', AccountId = accounts[1].Id),
            new Contact(FirstName = 'Johnny', LastName = 'Walker', AccountId = accounts[1].Id)
        };
        insert contacts;
    }

    @isTest
    static void testNumAccounts() {
        Test.startTest();
        Integer numAccounts = DataLord.NumAccounts();
        Test.stopTest();
        System.assertEquals(5, numAccounts, 'Number of accounts should be 5');
    }

    @isTest
    static void testNumHot() {
        Test.startTest();
        Integer numHot = DataLord.NumHot();
        Test.stopTest();
        System.assertEquals(2, numHot, 'Number of hot accounts should be 2');
    }

    @isTest
    static void testNumComplex() {
        Test.startTest();
        Integer numComplex = DataLord.NumComplex();
        Test.stopTest();
        System.assertEquals(2, numComplex, 'Number of accounts with & in the name should be 2');
    }

    @isTest
    static void testBigFive() {
        Test.startTest();
        List<Account> bigFive = DataLord.BigFive();
        Test.stopTest();
        System.assertEquals(5, bigFive.size(), 'There should be 5 accounts returned');
        System.assertEquals(2000000, bigFive[0].AnnualRevenue, 'The account with the highest revenue should be first');
    }

    @isTest
    static void testLastBigOpportunity() {
        Test.startTest();
        Opportunity lastBigOpportunity = DataLord.LastBigOpportunity();
        Test.stopTest();
        System.assertNotEquals(null, lastBigOpportunity, 'There should be a big opportunity returned');
        System.assertEquals(150000, lastBigOpportunity.Amount, 'The most recent big opportunity should have an amount of 150000');
    }

    @isTest
    static void testMajorPlayers() {
        Test.startTest();
        List<Contact> majorPlayers = DataLord.MajorPlayers();
        Test.stopTest();
        System.assertEquals(3, majorPlayers.size(), 'There should be 3 contacts associated with hot accounts');
    }

    @isTest
    static void testMostPopularAccount() {
        Test.startTest();
        String mostPopularAccount = DataLord.MostPopularAccount();
        Test.stopTest();
        System.assertEquals('Hot Account 2', mostPopularAccount, 'The account with the most contacts should be "Hot Account 2"');
    }

    @isTest
    static void testTopLeadSources() {
        Test.startTest();
        List<DataLord.LeadSourceLikelihood> topLeadSources = DataLord.TopLeadSources();
        Test.stopTest();
        System.assertNotEquals(0, topLeadSources.size(), 'There should be some lead sources returned');
        // Assuming LeadSourceLikelihood is structured properly, we might check its contents here
    }
}
