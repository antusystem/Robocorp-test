# Robocorp Test
## Robot for writing and reading the console


This Robot opens the Ubuntu console via OCR, later it writes `sudo lshw` and selects everything in the console with `ctrl`+`alt`+`e` and later copies it with `ctrl`+`shift`+`c`  (these shotcuts have to be configure previously on the terminal).

Afterwards, it remove extra information from the copied values, and last it search for the word in `${buscar}`.

Note: it is far more easy to use `sudo lshw > text_from_terminal.txt` and then read that file, but this was a test. Also, you can do this with mostly the same code.


### Configuration

 You need to install lshw to be able to use that command. Also, remember to write the right direction in the devdata/env.json so it can read the json file which contains the password to be able to use sudo in the terminal. 
 
### Additional documentation
See [Robocorp Docs](https://robocorp.com/docs/) for more documentation.
