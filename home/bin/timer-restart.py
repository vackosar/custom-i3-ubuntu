#!/usr/bin/python3

import time
from datetime import datetime
import os

# define the path to the file
filepath = os.path.expanduser('~/.my-timer.txt')

# open the file in append mode
# enter an infinite loop
while True:
    # get the current time
    now = datetime.now()
    # convert the current time to the requested format
    current_time = now.strftime('%H:%M:%S')
    with open(filepath, 'w') as f:
        # write the current time to the file
        f.write(current_time + "\n")

    # wait for 5 seconds before the next write
    time.sleep(5)

