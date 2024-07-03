import { LightningElement, track, wire } from 'lwc';
import findAccounts from '@salesforce/apex/AccountController.findAccounts';

export default class AccountSearchWire extends LightningElement {
    @track searchKey = '';
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Rating', fieldName: 'Rating' }
    ];
    @track accounts = { data: null, error: null };

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleRowSelection(event) {
        const selectedRows = event.detail.selectedRows;
        const selectedEvent = new CustomEvent('accountselected', {
            detail: selectedRows.length > 0 ? selectedRows[0].Id : null
        });
        this.dispatchEvent(selectedEvent);
    }

    @wire(findAccounts, { searchKey: '$searchKey' })
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = { data, error: null };
        } else if (error) {
            this.accounts = { data: null, error };
        }
    }
}
