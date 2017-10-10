@functional @bug @all
Feature: Negative responses after making a delete request by invalid id

  Scenario Outline: Can't delete a channel by id with invalid params
    Given I make a 'DELETE' request to '/channels/<Id>' endpoint
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And the response body contains excluding 'timestamp':
    """
    {
      "status": 400,
      "error": "Bad Request",
      "exception": "org.springframework.web.method.annotation.MethodArgumentTypeMismatchException",
      "message": "Bad Request",
      "path": "/channels/<Id>"
    }
    """
    Examples:
      | Id     |
      | abc    |
      | !@$    |
      | SDDF   |
      | 070./  |
      | 4*]@!# |
      | AMct   |
      | 510@   |
      | 510.   |
      | 510.1  |
      | 510.a  |
      | 51#$   |
      | 610.M  |
      | .      |
      | 1170   |
      |        |



