# Robocorp Test
## Robot for writing and reading the terminal using OperatingSystem and Process libraries


This Robot shows how to use both OperatingSystem and Process libraries. Keep in mind that every `Run` or `Run Process` occurs in a single shell, so if you want to do several commands you have to do it with `;` or `&&`.

Note: in the `Tail` keyword I still haven't test everything. I still don't know why it does not return the right thing using `${result}=    Run Process    tail    -f    prueba.py    |    grep    print    timeout=10s` or `${result}=    Run Process    cd    devdata`

 
### Additional documentation
See [Robocorp Docs](https://robocorp.com/docs/) for more documentation.
