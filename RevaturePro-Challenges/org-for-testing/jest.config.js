const { jestConfig } = require('@salesforce/sfdx-lwc-jest/config');

module.exports = {
    ...jestConfig,
    modulePathIgnorePatterns: ['<rootDir>/.localdevserver'],
    moduleNameMapper: {
        '^@salesforce/apex/ContactController.createContact$': '<rootDir>/force-app/main/default/test/jest-mocks/@salesforce/apex/ContactController.createContact.js',
        '^@salesforce/apex/AccountController.findAccounts$': '<rootDir>/force-app/main/default/test/jest-mocks/@salesforce/apex/AccountController.findAccounts.js'
    }
};
