trigger OrderAddProduct on Order (after insert) {
    List<OrderItem> orderItems = new List<OrderItem>();
    Product2 product = [SELECT Id FROM Product2 WHERE Name = 'Installation: Portable Product' LIMIT 1];
    
    if (product != null) {
        // Query the standard price for the product
        PricebookEntry standardPriceEntry = [SELECT Id, UnitPrice FROM PricebookEntry WHERE Product2Id = :product.Id AND IsActive = true AND UseStandardPrice = true LIMIT 1];
        
        if (standardPriceEntry != null) {
            for (Order ord : Trigger.new) {
                Boolean productAlreadyAdded = [SELECT Id FROM OrderItem WHERE OrderId = :ord.Id AND Product2Id = :product.Id LIMIT 1].size() > 0;
                if (!productAlreadyAdded) {
                    orderItems.add(new OrderItem(
                        OrderId = ord.Id, 
                        Product2Id = product.Id, 
                        Quantity = 1, 
                        UnitPrice = standardPriceEntry.UnitPrice, 
                        PricebookEntryId = standardPriceEntry.Id
                    ));
                }
            }
            if (!orderItems.isEmpty()) {
                insert orderItems;
            }
        }
    }
}
