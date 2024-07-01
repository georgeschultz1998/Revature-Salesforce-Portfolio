import { LightningElement, track } from 'lwc';
import createContactRecord from '@salesforce/apex/ContactController.createContact';

export default class CreateContact extends LightningElement {
    firstName = '';
    lastName = '';
    email = '';
    phone = '';
    accountId = '';
    errorMessage = '';

    handleInputChange(event) {
        const field = event.target.dataset.id;
        this[field] = event.target.value;
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
                console.log('Contact created successfully');
            })
            .catch(error => {
                this.errorMessage = `Error creating contact: ${error.body.message}`;
                console.error('Error creating contact', error);
            });
    }
}
