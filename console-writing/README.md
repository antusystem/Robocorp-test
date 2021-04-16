# Robocorp Test
## Robot for writing and copying text from the console with mouse movement


This Robot opens the Ubuntu console via OCR, later it writes `ls`, then it present 5 forms or ways in which you can copy the text (only work 3 of them: 1, 2, and  4). 

- The first one just copies everything in the terminal
- The second one uses `Drag and Drop` to move the mouse from `source` to `destination` as `points` on the screen. Later it copies the content and log it.
- The third one tries to use OCR for text recognition but fails.
- The fourth one is like the second one, but more manually due to the methods it uses. It also uses `offset` locator instead of point.
- The last one should be the quickest way but for some reason it does not work. It presses `ctrl`+`alt`+`t` to open directly the terminal, but it does not do it. Later it tries pressing the win/Super key from the keyboard and tries to type `gnome-terminal` to open the terminal, but again, it does not work. 


The last part of the code shows how to run a `.py` file with the terminal.

Note: it is easier to use `sudo lshw > text_from_terminal.txt` and then read that file, but this was a test. Also, you can do this with mostly the same code.

Note 2: its far more easy to use the library OperatingSystem or Process. Check the `run_process_example` to see how to use it.


 
### Additional documentation
See [Robocorp Docs](https://robocorp.com/docs/) for more documentation.
