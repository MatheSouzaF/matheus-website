const { defineConfig } = require("cypress");

module.exports = defineConfig({
  env: {
    wpUser: 'admin',
    wpPassword: 'admin'
  },
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
