import { LightningElement, track, wire } from 'lwc';
import findAccounts from '@salesforce/apex/AccountController.findAccounts';

export default class AccountSearchWire extends LightningElement {
    @track searchKey = '';
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Rating', fieldName: 'Rating' },
    ];

    @wire(findAccounts, { searchKey: '$searchKey' })
    accounts;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }
}
