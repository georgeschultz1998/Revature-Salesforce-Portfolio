import { LightningElement, track } from 'lwc';
import findAccounts from '@salesforce/apex/AccountController.findAccounts';

export default class AccountSearchImperative extends LightningElement {
    @track searchKey = '';
    @track accounts;
    @track error;
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Rating', fieldName: 'Rating' },
    ];

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
        this.handleSearch();
    }

    handleSearch() {
        findAccounts({ searchKey: this.searchKey })
            .then(result => {
                this.accounts = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.accounts = undefined;
            });
    }
}
