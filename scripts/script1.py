#!/usr/bin/env python3
import time
NULL_CHAR = chr(0)

def write_report(report):
    with open('/dev/hidg0', 'rb+') as fd:
        fd.write(report.encode())
time.sleep(2)
#never
write_report(NULL_CHAR*2+chr(17)+NULL_CHAR*5)
time.sleep(0.1)
write_report(NULL_CHAR*2+chr(8)+NULL_CHAR*5)
time.sleep(0.1)
write_report(NULL_CHAR*2+chr(25)+NULL_CHAR*5)
time.sleep(0.1)
write_report(NULL_CHAR*2+chr(8)+NULL_CHAR*5)
time.sleep(0.1)
write_report(NULL_CHAR*2+chr(21)+NULL_CHAR*5)
time.sleep(0.1)
#seta pra baixo
write_report(NULL_CHAR*2+chr(81)+NULL_CHAR*5)
time.sleep(0.1)
write_report(NULL_CHAR*8)
time.sleep(0.1)
write_report(NULL_CHAR*2+chr(81)+NULL_CHAR*5)
time.sleep(0.1)
#enter
write_report(NULL_CHAR*2+chr(88)+NULL_CHAR*5)
time.sleep(0.1)
write_report(NULL_CHAR*8)   
