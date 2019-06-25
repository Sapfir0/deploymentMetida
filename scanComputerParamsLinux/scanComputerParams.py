#!/usr/bin/python3
# -*- coding: utf-8 -*-

import time
import RAM
from CPU import CPU
from RAM import RAM
from Discs import Discs
from GPU import GPU

PC_Id = 1
#import datetime
#import serial
#ser = serial.Serial(port='/dev/ttyUSB0', baudrate=115200,  timeout=1, xonxoff=False, dsrdtr=False, interCharTimeout=False)

import requests

PC_Id=1
scanCpu = CPU(); ScanRam = RAM(); scanHdd = Discs()
scanGpu = GPU()

while True:
    hddt = scanHdd.getTempOfDiscs()
    cput = scanCpu.getTempOfCPU()
    cpuu = scanCpu.getLoadOfCpuByUptime()
    cpul = scanCpu.getLoadOfCpuByIostat()
    gld = scanGpu.getTempOfGPU()
    ram = ScanRam.getUnusedRAM()
    print("-----------------")
    payload = {
        'HDD_temp': hddt, 
        'CPU_temp': cput, 
        'CPU_currentLoad': cpuu[0], 
        'CPU_5minute_load': cpuu[1], 
        'CPU_15minute_load': cpuu[2], 
        'CPU_load_iostat': cpul,
        'all_RAM ': ram[0], 
        'loaded_RAM': ram[1],
        'free_RAM': ram[2],
        'GPU_temp': gld,
        'PC_Id': PC_Id
    }
    response = requests.post('https://meteo-server.herokuapp.com/computerLoadParams', data=payload)
    print(response.text)
    time.sleep(5*60)




howManyCoreIHave = "cat /proc/cpuinfo | grep \"cpu cores\" " #есть еще лулзный варик в начале 



