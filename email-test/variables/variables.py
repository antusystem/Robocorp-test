from datetime import datetime
from time import gmtime, strftime, localtime

TODAY = datetime.now()
DIA = strftime("%a, %d %b %Y %H:%M:%S %z", localtime())

