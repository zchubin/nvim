#! /bin/bash -e

echo '[*] 正在准备Neovim配置文件目录...'
mkdir -p ~/AppData/Local/nvim

#echo '[*] 配置依赖...'
#pip3 install --user --upgrade pynvim

echo '[*] 正在准备 vim-Plug...'
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)

echo -e '[*] Running :PlugInstall within nvim ...'
sed '安装插件' init.vim > ~/AppData/Local/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

echo -e "[+] Done, welcome to \033[1m\033[92mNeoVim\033[0m! Try it by running:
nvim/vim. Want to customize it? Modify ~/AppData/Local/nvim/init.vim"