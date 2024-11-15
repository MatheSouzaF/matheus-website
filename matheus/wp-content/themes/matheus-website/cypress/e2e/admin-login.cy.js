describe('login', () => {
	it('should login in wp-admin page', () => {
    //when
    cy.visit('http://localhost/wp-login.php');

    //given
		cy.get('#user_login').type(Cypress.env("wpUser"));
		cy.get('#user_pass').type(Cypress.env("wpPassword"));
		cy.get('#wp-submit').click();
		
    //then
		cy.url().should('eq', 'http://localhost/wp-admin/');
  });
});