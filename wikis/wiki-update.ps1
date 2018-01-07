Set-Content -Path '..\webs\wikis.js' -Value 'var wikiLists = ['
Get-ChildItem -Path '.\' -Filter '*.md' | ForEach-Object {
$Name = $_.Basename
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value '{url: ".\\wikis\\'
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value $Name
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value '.md'
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value '", title: "'
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value $Name
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value '"},'
Add-Content -Path '..\webs\wikis.js' -NoNewline -Value `n
}
Add-Content -Path '..\webs\wikis.js' -Value '];'
