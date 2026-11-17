@Echo off
echo set sh=WScript.CreateObject("WScript.Shell") >tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "open 192.168.1.1{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "root{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "adminHW{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "su{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "shell{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "cd /mnt/jffs2{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "tftp -p -l hw_boardinfo -r hw_boardinfo 192.168.1.8{ENTER}" >>tmp.vbs
echo WScript.Sleep 1000 >>tmp.vbs
echo sh.SendKeys "tftp -g -l e8c.tar.gz -r e8c.tar.gz 192.168.1.8{ENTER}" >>tmp.vbs
echo WScript.Sleep 3000 >>tmp.vbs
echo sh.SendKeys "tar -xvf e8c.tar.gz{ENTER}" >>tmp.vbs
start telnet
cscript //nologo tmp.vbs
del tmp.vbs