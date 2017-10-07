@smoke @all
Feature: Channels and Templates

  Scenario Outline: Get all
    Given I make a 'GET' request to '<endpoint>' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
    Examples:
      | endpoint   |
      | /channels  |
      | /templates |