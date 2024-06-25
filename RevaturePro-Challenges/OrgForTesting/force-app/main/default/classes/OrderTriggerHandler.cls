public class OrderTriggerHandler {
    
    public static void handleBeforeInsert(List<Order> newOrders) {
        addProduct(newOrders);
    }

    private static void addProduct(List<Order> newOrders) {
        List<OrderItem> itemsToCreate = new List<OrderItem>();
        for (Order o : newOrders) {
            Boolean productExists = [SELECT COUNT() FROM OrderItem WHERE OrderId = :o.Id AND Product2Id = 'PortableProductId'];
            if (!productExists) {
                itemsToCreate.add(new OrderItem(
                    OrderId = o.Id,
                    Product2Id = 'PortableProductId',
                    Quantity = 1,
                    UnitPrice = 0
                ));
            }
        }
        if (!itemsToCreate.isEmpty()) {
            insert itemsToCreate;
        }
    }
}
