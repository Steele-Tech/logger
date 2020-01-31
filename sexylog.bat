@echo off
:menu
echo 1. (VirtualBox Host-Only Network)
echo 2. (Local Area Connection* 5)
echo 3. (Local Area Connection* 3)
echo 4. (Local Area Connection* 4)
echo 5. (Npcap Loopback Adapter)


set /p tt=run
if %tt%==1 goto 1
if %tt%==2 goto 2
if %tt%==3 goto 3
if %tt%==4 goto 4
if %tt%==5 goto 5




:1
  cd c:\"program files"\wireshark\

  mkdir "C:\Users\DaVinci\wireshark_logs\%date%-%time%.log"

  tshark  -i 1 > "C:\Users\DaVinci\wireshark_logs\%date%-%time%.log"

  ::-b duration:1800 -w C:\Users\DaVinci\wireshark_logs\

  ::goto create
  pause
  cls
  goto menu


:2
  start c:\"program files"\wireshark\dumpcap.exe -i 2 -w testfile.txt -c 100

  pause
  cls
  goto menu

:3
  start c:\"program files"\wireshark\dumpcap.exe -i 3 -p
  pause
  cls
  goto menu

:4
  start c:\"program files"\wireshark\dumpcap.exe -i 4 -p
  pause
  cls
  goto menu

:5
  start c:\"program files"\wireshark\dumpcap.exe -i 5 -p
  pause
  cls
  goto menu




:create






::SET pcap_to_txt=pcap -V -r file_to_convert.pcap > file_to_convert.txt
  ::echo Converting File %pcap_to_txt% >> "C:\Users\DaVinci\wireshark_logs"
  ::%pcap_to_txt% >> "C:\Users\DaVinci\wireshark_logs" 2>%1
  ::echo Check logs
  PAUSE
  GOTO MENU
  ) ELSE (
    GOTO ERROR
    PAUSE
    GOTO END
    )





:: ---------------------------------------------------NOTES-----------------------------------------------------------------------------
:: prompt one file converter

REM -i 1 -p -V -r file_to_convert.pcap > file_to_convert.dns

REM "works but doesnt save the file" -i 1 -p -V -r file_to_convert.pcap > file_to_convert.tx

REM -r <file_to_convert.pcap>  -w file243.txt

REM -x -r mydata.pcapng | sed -n 's/^[0-9a-f]*\s\(\(\s[0-9a-f][0-9a-f]\)\{1,16\}\).*$/\1/p'

REM -i 1 -w - < "C:\Users\DaVinci\AppData\Local\Temp.pcapng" > "C:\output.txt"

REM -i 1 -F log.txt -W n

REM -V -r file_to_convert.pcapng > logs.txt

::---------------------------------------------------------------------------------------------

rem mkdir dns

rem for %%a in (*.pcapng) do tshark -r %%a -Y "dns" -w dns/%%a
























REM cd /d "c:\program files\wireshark"

REM tshark -T fields -n -r "C:\Users\DaVinci\AppData\Local\Temp\wireshark_VirtualBox Host-Only Network_20200128140450_a03436.pcapng" -E separator=, -e ip.src -e ip.dst > "C:\Users\DaVinci\wireshark_logs\logcapture.txt"


REM tshark -V -r %1 -T fields -E header=y -e wlan.sa - ip.src -e wlan.da -e ip.dst -E separator=, > %2

pause
