@PowerShell -ExecutionPolicy Bypass -Command Invoke-Expression $('$args=@(^&{$args} %*);'+[String]::Join(';',(Get-Content '%~f0') -notmatch '^^@PowerShell.*EOF$')) & goto :EOF

echo "                  _           _     _       "
echo "                 | |         | |   (_)      "
echo "          _______| |__  _   _| |__  _ _ __  "
echo "         |_  / __| |_ \| | | | |_ \| |  _ \ "
echo "          / / (__| | | | |_| | |_) | | | | |"
echo "         /___\___|_| |_|\__,_|_.__/|_|_| |_|"

Push-Location ~

$app_name  = "zchubin"
$repo_url  = "https://github.com/zchubin/nvim.git"
$repo_path = "$HOME\AppData\Local\nvim"

Function Pause ($Message = "Press any key to continue . . . ") {
  if ((Test-Path variable:psISE) -and $psISE) {
    $Shell = New-Object -ComObject "WScript.Shell"
      $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
  } else {
    Write-Host -NoNewline $Message
      [void][System.Console]::ReadKey($true)
      Write-Host
  }
}

echo "==> Start testing depends on the environment ..."
echo ""
sleep 1


echo "==> Testing git command!"
if (Get-Command "git" -ErrorAction SilentlyContinue) {
  git version
  echo "[OK] The test is successful, start the next test ..."
  sleep 1
} else {
  echo ""
  echo "[ERROR] Cannot find the 'git.exe' command in your PATH!!!"
  echo ">>> Ready to quit......"
  Pause
  exit
}

echo ""

echo "==> Testing 'nvim' command"
if (Get-Command "nvim" -ErrorAction SilentlyContinue) {
  echo ($(nvim --version) -split '\n')[0]
  echo "[OK] The test is successful, start the next test ..."
  sleep 1
} else {
  echo "[WARNING] Cannot find the 'gvim.exe' command in your PATH, but still can continue!"
  echo ""
  echo "[WARNING] Please install gvim later or set your PATH correctly!"
  Pause
}

echo ""

echo "==> Testing 'Python' command"
if (Get-Command "Python" -ErrorAction SilentlyContinue) {
  echo ($(python --version) -split '\n')[0]
  echo (python -m pip install --upgrade pip)
  echo (pip3 install pynvim neovim)
  echo "[OK] The test is successful, start the next test ..."
  sleep 1
} else {
  echo "[WARNING] Cannot find the 'python.exe' command in your PATH, but still can continue!"
  echo ""
  echo "[WARNING] Please install python later or set your PATH correctly!"
  Pause
}

echo ""

echo "==> Testing 'Ruby' command"
if (Get-Command "Ruby" -ErrorAction SilentlyContinue) {
  echo ($(ruby --version) -split '\n')[0]
  echo (cmd /c gem list -ra ^^neovim$)
  echo "[OK] The test is successful, start the next test ..."
  sleep 1
} else {
  echo "[WARNING] Cannot find the 'ruby.exe' command in your PATH, but still can continue!"
  echo ""
  echo "[WARNING] Please install Ruby later or set your PATH correctly!"
  Pause
}

echo ""

echo "==> Testing 'Nodejs' command"
if (Get-Command "Node" -ErrorAction SilentlyContinue) {
  echo ($(node --version) -split '\n')[0]
  echo (npm install -g neovim)
  echo "[OK] The test is successful, start the next test ..."
  sleep 1
} else {
  echo "[WARNING] Cannot find the 'node.exe' command in your PATH, but still can continue!"
  echo ""
  echo "[WARNING] Please install Node later or set your PATH correctly!"
  Pause
}

echo ""

echo "<== Surroundings rely testing completed. Continue to the next step ..."
sleep 1
echo ""
echo ""
echo "[-------- zhucbin's Vim --------]"
echo ""

if (!(Test-Path "$HOME\AppData\Local\nvim")) {
  New-Item $HOME\AppData\Local\nvim -type directory
  echo "==> Installing $app_name"
  git clone $repo_url $repo_path
} else {
  echo "==> Updating $app_name"
  Push-Location $repo_path
  git pull origin master
}

echo ""

if (!(Test-Path "$HOME\vimfiles")) {
  cmd /c mklink $HOME\vimfiles $repo_path
  echo "[OK] Installed for your (N)Vim install 'zchubin' configuration!"
  sleep 1
} else {
  echo "[OK] $HOME\vimfiles already exists."
  sleep 1
}

echo ""

if (!(Test-Path "$HOME\AppData\Local\nvim")) {
  echo "[OK] Installed for your neovim installed 'zchubin' configuration!"
  sleep 1
} else {
  echo "[OK] $HOME\AppData\Local\nvim already exists."
  sleep 1
}

echo ""
echo "The installation is complete!"
echo "=============================================================================="
echo "==          Open Neovim,All plugins will be installed automatically         =="
echo "=============================================================================="
echo ""

Pause

# vim:set ft=powershell nowrap:
