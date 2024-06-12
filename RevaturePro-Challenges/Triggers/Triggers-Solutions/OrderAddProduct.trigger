trigger OrderAddProduct on Order (after insert) {
    List<OrderItem> orderItems = new List<OrderItem>();
    Product2 product = [SELECT Id FROM Product2 WHERE Name = 'Installation: Portable Product' LIMIT 1];
    for (Order ord : Trigger.new) {
        Boolean productAlreadyAdded = [SELECT Id FROM OrderItem WHERE OrderId = :ord.Id AND Product2Id = :product.Id LIMIT 1].size() > 0;
        if (!productAlreadyAdded) {
            orderItems.add(new OrderItem(OrderId = ord.Id, Product2Id = product.Id, Quantity = 1, UnitPrice = product.StandardPrice));
        }
    }
    if (!orderItems.isEmpty()) {
        insert orderItems;
    }
}
