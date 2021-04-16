*** Settings ***
Documentation   Prueba de OperatingSystem y Process
Resource        keywords.robot
Library         Library.py
Variables       variables.py
Library         OperatingSystem
Library         Process


*** Keyword ***
Opsys
    [Documentation]  Test with OperatingSystem. I was not able to move outside the virtual enviorement
    
    #ASi no sirve porque cada ejecucion es un shell separado, no arrastra lo que pasa en un Run hacia el otro
    ${output}=    Run    pwd
    Log    ${output}
    Run    cd ..
    ${output}=    run    pwd
    Log    ${output}
    Run    cd Desktop
    ${output}=    run    pwd
    Log    ${output}
    
        #Para que corra en una single shell
    ${output}=   Run   cd .. ; pwd ; ls
    Log    ${output}
    #Para que se ejecuten solo si el comando anterior fue exitoso
    ${output}=   Run   cd .. && pwd && ls
    Log    ${output}
    
    #Ejecutar comando
    ${output}=    Run    ls
    Log    ${output}
    
    #Ejecutando un archivo
    ${output}=    Run    python3 prueba.py
    Log    ${output}
    
    #Pasando un argumento seria algo asi, pero no me sirve, mejor es usar Process
    ${output}=    Run    python3 prueba2.py 'prueba'
    Log    ${output}
    
    #Deberia devolver el codigo como un integer entre 0 y 255, pero no estoy claro del uso, es mejor una en Process
    ${rc}=    Run and Return RC    ls
    
    #Devuelve el RC y la salida de texto de la consla, es mejor una en Process segun ellos
    ${rc}    ${output} =    Run and Return RC and Output    ls
    
    #A;adir texto a un archivo
    Append To File    prueba2.py    Texto anadido

    #Leer un archivo
    ${text}=    Get File    prueba2.py
    ${size}=    Get File Size    prueba.py
    ${time}=    Get Modified Time    prueba2.py
    ${secs} =   Get Modified Time    ${CURDIR}    epoch
    ${year} =   Get Modified Time    prueba.py    return year
    ${y}    ${d} =    Get Modified Time    ${CURDIR}     year,day
    @{timee} =    Get Modified Time    ${CURDIR}    	year,month,day,hour,min,sec
    Log File    prueba2.py
    
    #Buscar en un texto, If more complex pattern matching is needed, it is 
    #possible to use Get File in combination with String library keywords like Get Lines Matching Regexp.
    ${ret} =    Grep File    prueba.py    print(b)

*** Keyword ***
Procs
    [Documentation]  Test with Process.
    ${result} =    Run Process    python    -c    print('Hello, world!')    cwd=ejemplos
    Should Be Equal    ${result.stdout}	    Hello, world!
    Log    ${result.stdout}
    Log    ${result.stderr}
    ${result} =	Run Process	    ls	stderr=STDOUT	timeout=10s
    ${result} =	Run Process	    ls	timeout=1min	on_timeout=continue
    ${result} =	Run Process	java -Dname\=value Example	shell=True	cwd=ejemplos
    
    #Ejecutando un archivo, con stdout=STDERR se guardara la respuesta en un archivo con ese nombre
    ${result} =    Run Process    python3    prueba.py    stdout=salida
    Log    ${result.stdout}
    
    #Con cwd se cambia de directorio, esto de abajo dara error que se ve en el .stderr. 
    #si stderr es igual a algo, se guarda el error en ese archivo creado en la direccion actual
    ${result} =	Run Process	 python3    prueba.py Example	cwd=ejemplos    stderr=sal_error    stdout=sal2
    Log    ${result.stdout}
    Log    ${result.stderr}
    
    #Pasando argurmentos, tampoco me sirve
    #${result} =    Run Process    python3    prueba2.py    var\=value
    #Log    ${result.stdout}
    #name\=value

*** Keyword ***
Tail

    ${output}=    Run    tail prueba.py | grep print
    Log    ${output}
    #Para que corra en una single shell
    ${output}=   Run   cd .. ; pwd ; ls
    Log    ${output}
    #Para que se ejecuten solo si el comando anterior fue exitoso
    ${output}=   Run   cd .. && pwd && ls
    Log    ${output}
    ${result}=    Run Process    tail    -f    prueba.py    |    grep    print    timeout=10s
    Log    ${result.stdout}
    Log    ${result.stderr}
    
    #Este no sirve
    ${result}=    Run Process    tail -f prueba.py | grep print    timeout=10s    shell=True
    Log    ${result.stdout}
    Log    ${result.stderr}
    
    ${result}=    Run Process    pwd
    Log    ${result.stdout}
    Log    ${result.stderr}

    ${result}=    Run Process    cd    devdata
    Log    ${result.stdout}
    Log    ${result.stderr}
    ${result}=    Run Process    pwd
    Log    ${result.stdout}
    Log    ${result.stderr}
    ${result}=    Run Process    ls
    Log    ${result.stdout}
    Log    ${result.stderr}
    
    #${output}=    Run Process    tail -f prueba.py | grep print
    #Log    ${output}

*** Tasks ***
Prueba de Libreria OperatingSystem y de Process
    Example Keyword
    Example Python Keyword
    
    #Opsys
    #Procs
    Tail
