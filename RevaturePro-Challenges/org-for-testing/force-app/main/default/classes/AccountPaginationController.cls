public class AccountPaginationController {
    public List<Account> accounts { get; private set; }
    public Integer offset { get; private set; }
    private final Integer limitSize = 10;
    public Account account { get; private set; }

    public AccountPaginationController(ApexPages.StandardController controller) {
        this.account = (Account)controller.getRecord();
        offset = 0;
        accounts = fetchAccounts();
    }

    public List<Account> fetchAccounts() {
        return [SELECT Name, Industry FROM Account LIMIT :limitSize OFFSET :offset];
    }

    public void next() {
        offset += limitSize;
        accounts = fetchAccounts();
    }

    public void previous() {
        if (offset >= limitSize) {
            offset -= limitSize;
            accounts = fetchAccounts();
        }
    }
}
