*** Settings ***
Library         RequestsLibrary
Library         ../Libs/Activity.py
Library         JsonValidator
Library         ../Libs/Common.py
Variables       ../Schemas/ActivitySchema.py
Variables       ../DevData/Env.py

*** Variables ***
${baseUrl}      https://fakerestapi.azurewebsites.net
${activitesPath}        /api/v1/Activities
${payload}      Create Activity     title=Test  dueDate=2023-06-24T22:53:53.978Z    completed=true
${headers}      Create Activity     Content-Type: application/json; v=1.0

*** Keywords ***
The aplication is running
    ${response}=    GET     ${base_url}
    Should Be Equal As Strings     ${response}      <Response [200]>

I send a POST request to create an activity
    ${resp}     POST ACTIVITY
    Set Global Variable    ${response}      ${resp}

The response must be the new activity
    Should Be Equal As Strings     ${response.status_code}    200
    Should Be Equal As Strings     ${response.text}     {"id":0,"title":"Test","dueDate":"2023-06-24T22:53:53.978Z","completed":true}
    ${json}=    evaluate    json.loads('''${response.text}''')    json
    Validate Json With Schema   ${json}     ${activitySchema}
