public class PlaygroundSetup {
    public static void Setup(Integer numRecords) {
        Integer numAccounts = numRecords;
        Integer numLeads = numRecords;
        Integer numProducts = numRecords / 2;

        List<Account> accountsToCreate = new List<Account>();
        List<Contact> contactsToCreate = new List<Contact>();
        List<Lead> leadsToCreate = new List<Lead>();
        List<Product2> productsToCreate = new List<Product2>();

        for (Integer i = 0; i < numAccounts; i++) {
            Decimal annualRevenue = (Decimal)Math.rint(Math.random() * (3000000 - 10000)) + 10000;
            String rating;
            if (annualRevenue < 75000) {
                rating = 'Cold';
            } else if (annualRevenue < 750000) {
                rating = 'Warm';
            } else {
                rating = 'Hot';
            }

            Account acc = new Account(
                Name = 'Account' + i,
                AnnualRevenue = annualRevenue,
                Rating = rating
            );
            accountsToCreate.add(acc);

            Integer numContacts = (Integer)Math.rint(Math.random() * 4);
            for (Integer j = 0; j < numContacts; j++) {
                Contact con = new Contact(
                    LastName = 'Contact' + j,
                    Email = 'Contact' + j + '@Account' + i + '.com',
                    AccountId = acc.Id
                );
                contactsToCreate.add(con);
            }
        }

        for (Integer i = 0; i < numLeads; i++) {
            Lead lead = new Lead(
                LastName = 'Lead' + i,
                Company = 'Account' + (i % numAccounts),
                Email = 'Lead' + i + '@Account' + (i % numAccounts) + '.com'
            );
            leadsToCreate.add(lead);
        }

        for (Integer i = 0; i < numProducts; i++) {
            Product2 prod = new Product2(
                Name = 'Product' + i,
                ProductCode = 'P' + i,
                IsActive = true
            );
            productsToCreate.add(prod);
        }

        insert accountsToCreate;
        insert contactsToCreate;
        insert leadsToCreate;
        insert productsToCreate;
    }
}
