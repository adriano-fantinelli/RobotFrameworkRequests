*** Settings ***
Resource        ../Resources/activity.resource

*** Test Cases ***
Create an activity
    Given The aplication is running
    When I send a POST request to create an activity
    Then The response must be the new activity