#!/usr/bin/python3

import time
from datetime import datetime, timedelta
import os

# define the path to the file
filepath = os.path.expanduser('~/.my-timer.txt')

# open the file in append mode
# enter an infinite loop


# get the start time
start_time = time.monotonic()

# enter an infinite loop
while True:
    # get the current time
    now = time.monotonic()
    elapsed_time = now - start_time
    # convert the elapsed time to hours, minutes and seconds
    elapsed_time = str(timedelta(seconds=int(elapsed_time)))
    with open(filepath, 'w') as f:
        # write the current time to the file
        f.write(elapsed_time + "\n")
        print(elapsed_time)

    # wait for 5 seconds before the next write
    time.sleep(5)

