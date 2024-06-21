public class AccountExtension {
    public Account account { get; private set; }

    public AccountExtension(ApexPages.StandardController controller) {
        this.account = (Account)controller.getRecord();
    }
}
