@Regression
Feature: Desktop Checkout for Guest User
  As a customer
  I want to be able proceed to checkout
  So that I can specify my delivery and payment details and place the order

  Scenario: Proceed to checkout, final review and place order as guest user
    Given I am an anonymous customer with clear cookies
    When I open the "Initial home page"
    And I search for "Thinking in Java"
    And I am redirected to a "Search page"
    And Search results contain the following products
      | Thinking in Java       |
      | Thinking Java Part I   |
      | Core Java Professional |
    And I apply the following search filters
      | Price range  | 30 € +        |
      | Availability | In Stock (5)  |
      | Language     | English (5)   |
      | Format       | Paperback (5) |
    Then Search results contain only the following products
      | Thinking in Java                                                      |
      | Think Java                                                            |
      | Thinking Recursively with Java                                        |
      | Java and Algorithmic Thinking for the Complete Beginner (2nd Edition) |
      | Core Java Professional                                                |
    When I click 'Add to basket' button for product with name "Thinking in Java"
    And I select 'Basket/Checkout' in basket pop-up
    Then I am redirected to the "Basket page"
    And Basket order summary is as following:
      | Delivery cost | Total   |
      | FREE          | 64,61 € |
    When I click 'Checkout' button on 'Basket' page
    Then I am redirected to the "Checkout" page
    When I click 'Buy now' button
    Then the following validation error messages are displayed on 'Delivery Address' form:
      | Form field name | validaton error message                               |
      | Email addres    | Please enter your Email address                       |
      | Full name       | Please enter your Full name                           |
      | Address line 1  | Please enter your Address line 1                      |
      | Town/City       | Please enter your Town/City                           |
      | Postcode/ZIP    | Please enter your postcode/ZIP or write 'No Postcode' |
    And the following validation error messages are displayed on 'Payment' form:
      | Please enter your card number, Please enter your card's expiration date, Please enter your CVV |
    And Checkout order summary is as following:
      | Sub-total | Delivery | VAT    | Total   |
      | 64,61 €   | FREE     | 0,00 € | 64,61 € |
    And I checkout as a new customer with email "test@user.com"
    When I fill delivery address information manually:
      | Full name | Delivery country | Address line 1   | Address line 2   | Town/City | County/State | Postcode |
      | John      | Ukraine          | Random address 1 | Random address 2 | Kyiv      | Random State | 12345    |
    Then there is no validation error messages displayed on 'Delivery Address' form
    When I enter my card details
      | Card Type    | Visa             |
      | Name On Card | RandomName       |
      | cardNumber   | 4111111111111111 |
      | Expiry Year  | 2022             |
      | Expiry Month | 03               |
      | Cvv          | 123              |