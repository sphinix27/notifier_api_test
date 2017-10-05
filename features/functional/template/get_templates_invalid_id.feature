Feature: Functional get for templates with ID

  Scenario Outline: Send a new template
    Given I make a 'GET' request to '/api/templates/<id>' endpoint
    When I execute the request to the endpoint
    Then I expect a '<status_code>' status code

    Examples:
      | id       | status_code | description                             |
      | yruadasd | 404         | Send an invalid id (letters)            |
      | asd13asd | 404         | Send an invalid id (letters and number) |
      | 1        | 404         | Send a non-exist id                     |
      |          | 404         | Send an empty id                        |
      | -3       | 404         | Send an id less or equals to 0          |
      | 00045    | 404         | Send an id with zeros by front          |
