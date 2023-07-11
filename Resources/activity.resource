*** Settings ***
Library         RequestsLibrary
Library         ../Libs/Activity.py
Library         JsonValidator
Library         ../Libs/Common.py
Variables       ../Schemas/ActivitySchema.py
Variables       ../Devdata/Env.py
Variables       ../Devdata/Activities.py

*** Keywords ***
The aplication is running
    ${response}=    GET     ${base_url}
    Should Be Equal As Strings     ${response.status_code}      ${status_code}[ok]

I send a POST request to create an activity
    ${resp}=     POST ACTIVITY       ${headers}     ${valid_activity}[0][id]     ${validActivity}[0][title]    ${validActivity}[0][dueDate]      ${validActivity}[0][completed]
    Set Global Variable    ${response}      ${resp}

The response must be the new activity
    Should Be Equal As Strings     ${response.status_code}    ${status_code}[ok]
    ${json}=    evaluate    json.loads('''${response.text}''')    json
    Should Be Equal As Strings     ${json}     ${valid_activity}[0]
    Validate Json With Schema   ${json}     ${activitySchema}
