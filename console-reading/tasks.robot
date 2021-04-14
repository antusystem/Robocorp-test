*** Settings ***
Documentation   Template robot main suite.
Resource        keywords.robot
Library         Library.py
Variables       variables.py
Library         RPA.Desktop
Library         RPA.Robocloud.Secrets


*** Variables ***
${buscar}=    capabilities

*** Tasks ***
Example task
    Example Keyword
    Example Python Keyword
    ${secret}=    Get Secret    Credentials
    #Con esto abro la consola
    Click    alias:Ubuntu.Terminal
    Sleep    4s
    Type text     sudo lshw    enter=True
    Sleep    1s
    Type text      ${secret}[password]    enter=True
    Sleep    5s
    Press Keys    ctrl  alt  e
    Press Keys    ctrl  shift  c
    Press Keys    alt  f4
    #Para copiar el valor de lo copiado en una variable
    ${text}=    Get clipboard value
    Log    Texto copiado con ctrl shift c '${text}'
    
    ${text}=    Cut String    ${text}
    Log    Luego de la funcion '${text}'
    
    Search    ${text}    ${buscar} 
