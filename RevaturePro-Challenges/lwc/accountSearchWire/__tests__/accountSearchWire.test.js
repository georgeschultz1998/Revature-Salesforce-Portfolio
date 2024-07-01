import { createElement } from 'lwc';
import AccountSearchWire from 'c/accountSearchWire';
import findAccounts from '@salesforce/apex/AccountController.findAccounts';

// Mocking the Apex wire adapter
jest.mock('@salesforce/apex/AccountController.findAccounts', () => {
    const { createApexTestWireAdapter } = require('@salesforce/sfdx-lwc-jest');
    return {
        default: createApexTestWireAdapter(jest.fn()),
    };
}, { virtual: true });

describe('c-account-search-wire', () => {
    let element; // Store the element reference for better access in tests

    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('renders data from wire adapter', async () => {
        element = createElement('c-account-search-wire', {
            is: AccountSearchWire
        });
        document.body.appendChild(element);

        // Mock data to be returned by the wire adapter
        const mockData = [{ Id: '001', Name: 'Account1', Industry: 'Tech', Rating: 'Hot' }];

        // Emit the mock data
        findAccounts.emit(mockData);

        await Promise.resolve(); // Wait for any asynchronous DOM updates

        // Check if data is rendered in the datatable
        const datatable = element.shadowRoot.querySelector('lightning-datatable');
        expect(datatable).not.toBeNull();
        expect(datatable.data).toEqual(mockData);
    });

    it('renders error message from wire adapter', async () => {
        element = createElement('c-account-search-wire', {
            is: AccountSearchWire
        });
        document.body.appendChild(element);

        // Mock error to be returned by the wire adapter
        const mockError = { message: 'Error loading accounts' };

        // Emit the mock error
        findAccounts.error(mockError);

        await Promise.resolve(); // Wait for any asynchronous DOM updates

        // Check if error message is rendered
        const errorDiv = element.shadowRoot.querySelector('.slds-text-color_error');
        expect(errorDiv).not.toBeNull();
        expect(errorDiv.textContent).toBe(`${mockError.message}`);
    });
});
