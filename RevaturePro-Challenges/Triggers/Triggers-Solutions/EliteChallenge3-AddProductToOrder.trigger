trigger AddProductToOrder on Order (after insert) {
    Product2 defaultProduct = [SELECT Id FROM Product2 WHERE Name = 'Installation: Portable Product' LIMIT 1];
    List<OrderItem> orderItemsToAdd = new List<OrderItem>();
    for (Order o : Trigger.new) {
        if ([SELECT Id FROM OrderItem WHERE OrderId = :o.Id AND Product2Id = :defaultProduct.Id LIMIT 1].size() == 0) {
            orderItemsToAdd.add(new OrderItem(OrderId = o.Id, Product2Id = defaultProduct.Id, Quantity = 1, UnitPrice = 0));
        }
    }
    if (!orderItemsToAdd.isEmpty()) {
        insert orderItemsToAdd;
    }
}
