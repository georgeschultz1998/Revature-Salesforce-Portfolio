import { createElement } from 'lwc';
import CreateContact from 'c/createContact';
import createContactRecord from '@salesforce/apex/ContactController.createContact';

// Mocking imperative Apex call
jest.mock('@salesforce/apex/ContactController.createContact', () => {
    return {
        default: jest.fn()
    };
}, { virtual: true });

describe('c-create-contact', () => {
    let element; // Store the element reference for better access in tests

    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('renders lightning-input and lightning-button', () => {
        element = createElement('c-create-contact', {
            is: CreateContact
        });
        document.body.appendChild(element);

        // Check if inputs are rendered
        const inputs = element.shadowRoot.querySelectorAll('lightning-input');
        expect(inputs.length).toBe(4); // Updated to 4 as there are now 4 input fields

        // Check if button is rendered
        const button = element.shadowRoot.querySelector('lightning-button');
        expect(button).not.toBeNull();
    });

    it('handles input change correctly', () => {
        element = createElement('c-create-contact', {
            is: CreateContact
        });
        document.body.appendChild(element);

        const firstNameInput = element.shadowRoot.querySelector('lightning-input[data-id="firstName"]');
        firstNameInput.value = 'John';
        firstNameInput.dispatchEvent(new CustomEvent('change'));

        // Verify that the input value has been updated correctly
        expect(firstNameInput.value).toBe('John');
    });

    it('calls Apex method on button click', async () => {
        element = createElement('c-create-contact', {
            is: CreateContact
        });
        document.body.appendChild(element);

        const contact = {
            FirstName: 'John',
            LastName: 'Doe',
            Email: 'john.doe@example.com',
            Phone: '1234567890',
            AccountId: '001XXXXXXXXXXXXXXX'
        };

        const firstNameInput = element.shadowRoot.querySelector('lightning-input[data-id="firstName"]');
        firstNameInput.value = contact.FirstName;
        firstNameInput.dispatchEvent(new CustomEvent('change'));

        const lastNameInput = element.shadowRoot.querySelector('lightning-input[data-id="lastName"]');
        lastNameInput.value = contact.LastName;
        lastNameInput.dispatchEvent(new CustomEvent('change'));

        const emailInput = element.shadowRoot.querySelector('lightning-input[data-id="email"]');
        emailInput.value = contact.Email;
        emailInput.dispatchEvent(new CustomEvent('change'));

        const phoneInput = element.shadowRoot.querySelector('lightning-input[data-id="phone"]');
        phoneInput.value = contact.Phone;
        phoneInput.dispatchEvent(new CustomEvent('change'));

        // Mock the account selection
        element.handleAccountSelected({ detail: contact.AccountId });

        createContactRecord.mockResolvedValue(contact);

        const button = element.shadowRoot.querySelector('lightning-button');
        button.click();

        // Wait for any asynchronous DOM updates
        await Promise.resolve();

        expect(createContactRecord).toHaveBeenCalled();
        expect(createContactRecord).toHaveBeenCalledWith({ contact });
    });

    it('renders error message from Apex call', async () => {
        element = createElement('c-create-contact', {
            is: CreateContact
        });
        document.body.appendChild(element);

        // Mock error to be returned by the Apex method
        const mockError = { body: { message: 'Error creating contact' } };
        createContactRecord.mockRejectedValue(mockError);

        // Trigger the createContact method
        const button = element.shadowRoot.querySelector('lightning-button');
        button.click();

        await new Promise(resolve => setTimeout(resolve, 0)); // Wait for any asynchronous DOM updates

        // Check if error message is rendered
        const errorDiv = element.shadowRoot.querySelector('.slds-text-color_error');
        expect(errorDiv).not.toBeNull();
        expect(errorDiv.textContent).toBe(`Error creating contact: ${mockError.body.message}`);
    });
});
