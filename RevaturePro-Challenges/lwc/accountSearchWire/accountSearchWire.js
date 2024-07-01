import { LightningElement, wire } from 'lwc';
import findAccounts from '@salesforce/apex/AccountController.findAccounts';

export default class AccountSearchWire extends LightningElement {
    searchKey = '';
    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Rating', fieldName: 'Rating' }
    ];
    accounts = { data: null, error: null };

    @wire(findAccounts, { searchKey: '$searchKey' })
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = { data, error: null };
        } else if (error) {
            this.accounts = { data: null, error };
        }
    }

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }
}
