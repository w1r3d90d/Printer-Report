;#Comment BD 2017.03.24
#Singleinstance force
#Notrayicon
Debug = 0

Gosub, NetworkCheck
If ( Debug = "1" )
	MsgBox,48,,Network Pass
RunWait, cmd /c powershell -Command "`& `{get-WmiObject -class Win32_printer `| ft name`, systemName`, shareName -AutoSize`}" `> `"N`:\MCOE Common Files\Brian\Printers\`%COMPUTERNAME`%-`%USERNAME`%.txt`",,hide
Exit

NetworkCheck:
IfNotExist, N:\MCOE Common Files\Brian\Printers\
{
If ( Debug = "1" )
	MsgBox,48,,Network Fail
Exit
}
IfExist, N:\MCOE Common Files\Brian\Printers\
Return