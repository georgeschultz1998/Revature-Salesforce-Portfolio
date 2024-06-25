public class WikipediaController {
    public String pageTitle { get; private set; }
    public String pagePreview { get; private set; }
    public String pageDescription { get; private set; }

    public WikipediaController() {
        pageTitle = 'Example Wikipedia Page';
        pagePreview = 'This is a preview of the Wikipedia page.';
        pageDescription = 'I like this page because it provides detailed information about a topic I am interested in.';
    }
}
