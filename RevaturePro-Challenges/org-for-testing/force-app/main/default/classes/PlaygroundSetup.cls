public class PlaygroundSetup {
    public static void Setup(Integer numRecords) {
        Integer numProducts = numRecords / 2;
        List<Account> accounts = new List<Account>();
        List<Lead> leads = new List<Lead>();
        List<Product2> products = new List<Product2>();
        
        for (Integer i = 0; i < numRecords; i++) {
            Decimal revenue = Math.floor(Math.random() * 2999000) + 10000;
            String rating = (revenue < 75000) ? 'Cold' : (revenue < 750000) ? 'Warm' : 'Hot';
            accounts.add(new Account(Name = 'Account' + i, AnnualRevenue = revenue, Rating = rating));
            leads.add(new Lead(LastName = 'Lead' + i, Company = 'Account' + i, Email = 'Lead' + i + '@account.com'));
        }
        
        for (Integer i = 0; i < numProducts; i++) {
            products.add(new Product2(Name = 'Product' + i, ProductCode = 'P' + i, Description = 'Product Description ' + i));
        }
        
        insert accounts;
        insert leads;
        insert products;
        
        List<PricebookEntry> pricebookEntries = new List<PricebookEntry>();
        Pricebook2 standardPricebook = [SELECT Id FROM Pricebook2 WHERE IsStandard = true LIMIT 1];
        for (Product2 prod : products) {
            pricebookEntries.add(new PricebookEntry(Pricebook2Id = standardPricebook.Id, Product2Id = prod.Id, UnitPrice = Math.floor(Math.random() * 1000) + 1, IsActive = true));
        }
        insert pricebookEntries;
    }
}
