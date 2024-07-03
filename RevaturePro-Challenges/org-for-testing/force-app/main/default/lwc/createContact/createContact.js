import { LightningElement, track, api } from 'lwc';
import createContactRecord from '@salesforce/apex/ContactController.createContact';

export default class CreateContact extends LightningElement {
    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track phone = '';
    @track accountId = '';
    @track errorMessage = '';

    handleInputChange(event) {
        const field = event.target.dataset.id;
        this[field] = event.target.value;
    }

    @api
    handleAccountSelected(event) {
        this.accountId = event.detail;
        console.log('Selected Account ID:', this.accountId);  // For debugging
    }

    createContact() {
        const contact = {
            FirstName: this.firstName,
            LastName: this.lastName,
            Email: this.email,
            Phone: this.phone,
            AccountId: this.accountId
        };

        createContactRecord({ contact })
            .then(() => {
                this.errorMessage = '';
                this.clearForm();
                console.log('Contact created successfully');
            })
            .catch(error => {
                this.errorMessage = `Error creating contact: ${error.body ? error.body.message : error.message}`;
                console.error('Error creating contact', error);
            });
    }

    clearForm() {
        this.firstName = '';
        this.lastName = '';
        this.email = '';
        this.phone = '';
        this.accountId = '';
    }
}
