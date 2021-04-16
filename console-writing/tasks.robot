*** Settings ***
Documentation   Template robot main suite.
Resource        keywords.robot
Library         Library.py
Variables       variables.py
Library         RPA.Desktop
Library         OperatingSystem


*** Keyword ***
Forma1
    #Con esto se puede copiar todo lo que hay en la consola y luego se puede asignar a una variable
    Press Keys    ctrl  alt  e
    Press Keys    shift  ctrl  c
    #El terminal se cierra presionando 1 vez ALT+F4, aunque a veces pide 2
    Press Keys    alt  f4
    #Press Keys    alt  f4
    ${text}=    Get clipboard value
    Log    Texto copiado  '${text}'

*** Keyword ***
Forma2
    #Con este poniendo point es una seccion especifica de la pantalla desde donde el mouse 
    #se va a mover hasta donde se detiene
    Drag And Drop    source=point:280,130    destination=point:750,220    start_delay=1    end_delay=1
    Press Keys    shift  ctrl  c
    #El terminal se cierra presionando 1 vez ALT+F4, aunque a veces pide 2
    Press Keys    alt  f4
    #Press Keys    alt  f4
    ${text}=    Get clipboard value
    Log    Texto copiado  '${text}'

*** Keyword ***
Forma3
    #Con este no logre que sirviera del todo, faltan mas pruebas, debes poner -tesseract=4.1.1 en el conda.yaml
    #Drag And Drop     ocr:"user@user-desktop"    ocr:"last_folder"
    #Press Keys    shift  ctrl  c
    #El terminal se cierra presionando 1 vez ALT+F4, aunque a veces pide 2
    #Press Keys    alt  f4
    #Press Keys    alt  f4
    #${text}=    Get clipboard value
    #Log    Texto copiado  '${text}'


*** Keyword ***
Forma4
    #Esto es como Drag and Drop pero manual, el offset es una posicion segun donde este actualmente el mouse
    Move mouse    offset:255,-205
    Press Mouse Button
    Move mouse    offset:450,100
    Release Mouse Button
    Press Keys    ctrl  alt  e
    Press Keys    shift  ctrl  c
    #El terminal se cierra presionando 1 vez ALT+F4, aunque a veces pide 2
    Press Keys    alt  f4
    #Press Keys    alt  f4
    ${text}=    Get clipboard value
    Log    Texto copiado  '${text}'

*** Keyword ***
Forma5
    #Con lo de abajo deberia de poderse abrir el terminal tambien, pero no sirven por alguna razon
    #Press Keys    ctrl    alt    t
    #Press Keys    cmd
    #Sleep    1s
    #Click    alias:Ubuntu.Search
    #Sleep    1s
    #Type Text Into    alias:Ubuntu.Search    terminal    enter=True
    #Type Text     gnome-terminal
    #Sleep    5s
    #Click    image:%{ROBOT_ROOT}/.images/ubuntu-searchapp-path.png
    #Type text     Terminal    enter=True

*** Keyword ***
Extra  
    #To execute a .py file name touch.py that is in the Desktop folder
    Type text     cd Desktop    enter=True
    Sleep    1s
    Type text     python3 touch.py    enter=True
    Sleep    2s

# +
*** Tasks ***
Example task
    Example Keyword
    Example Python Keyword
    
    #Con esto abro la consola, deberia servir tambien CTRL+ALT+T, pero no...
    #Click    alias:Ubuntu.Terminal
    #Sleep    3s
    #Type text     ls    enter=True
    
    #Forma1
    #Type text     ls    enter=True
    #Sleep    2s
    #Forma2
    #Type text     ls    enter=True
    #Sleep    2s
    #Forma3
    #Forma4    
    #Sleep    2s
    #Forma5
    #Extra
    
    ${output}=    Run    ls
    Log    ${output}
    
    



