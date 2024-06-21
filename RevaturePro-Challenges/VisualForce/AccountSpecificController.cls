public class AccountSpecificController {
    public Account account { get; private set; }
    public String aboutMe { get; private set; }
    public String greeting { get; private set; }

    public AccountSpecificController() {
        account = [SELECT Name, Industry FROM Account WHERE Name = 'Your Account Name' LIMIT 1];
        if (UserInfo.getLanguage() == 'es') {
            aboutMe = 'Sobre mí: Soy un desarrollador con experiencia en Salesforce.';
        } else {
            aboutMe = 'About Me: I am a developer with experience in Salesforce.';
        }
    }

    public void addGreeting() {
        greeting = 'Hello, ' + account.Name + '!';
    }
}
