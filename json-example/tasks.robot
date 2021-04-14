*** Settings ***
Documentation   Template robot main suite.
Resource        keywords.robot
Library         Library.py
Variables       variables.py
Library         RPA.JSON


*** Keyword ***
Cosas
    ${json}=    Load JSON from file    ${CURDIR}${/}example.json
    Log    ${json}
    ${json}=    Update value to JSON    ${json}    $.Ordenes.clave    001002003
    Save JSON to file    ${json}    ${CURDIR}${/}example.json
    ${obj}=    Set variable    {"Ordenes": {"clave": "123456789","accion": "borrartodo"}}
    ${json}=    Convert string to JSON    ${obj}
    Log    ${json}
    Log    Done.

*** Keyword ***
Cosas2
    #Sirve solo con RCC al menos para la version 9.5.0
    ${json}=    Load JSON from file    ${CURDIR}${/}example.json
    Log    ${json}
    ${first_order_id}=    Get value from JSON    ${json}    $.Ordenes
    ${first_order_id}=    Get value from JSON    ${json}    $.Ordenes.accion
    ${first_order_id}=    Get value from JSON    ${json}    $.Ordenes.clave
    @{names}=     Get values from JSON     ${json}   $.Ordenes
    ${json}=    Add to JSON    ${json}    $    {"idd": 3}
    ${json}=    Add to JSON    ${json}    @    {"iddd": 3}
    ${json}=    Add to JSON    ${json}    $.Ordenes    {"id": 3}
    ${json}=    Delete from JSON    ${json}    $.idd
    Save JSON to file    ${json}    ${CURDIR}${/}Ordenes.json
    Log    ${json}
    Log    Done.
    
    ${all_ids}=    Get values from JSON    ${json}    $.Ordenes.accion
    ${json}=    Update value to JSON    ${json}    $.Ordenes.clave    001002003
    Save JSON to file    ${json}    ${CURDIR}${/}example.json
    ${obj}=    Set variable    {"Ordenes": {"clave": "123456789","accion": "borrartodo" }}
    ${json}=    Convert string to JSON    ${obj}
    Log    ${json}
    Log    Done.

*** Tasks ***
Get all the names for all people
    Example Keyword
    Example Python Keyword
    Cosas2

