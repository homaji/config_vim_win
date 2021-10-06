# rcファイルをHOMEに配置

$currentpath = (Convert-Path .)
$vimrc = Join-Path $currentpath _vimrc
$gvimrc = Join-Path $currentpath _gvimrc
$viminit = Join-Path $currentpath vim-init
new-item -Path $HOME -Name _vimrc -Value $vimrc -ItemType hardlink
new-item -Path $HOME -Name _gvimrc -Value $gvimrc -ItemType hardlink
new-item -Path $HOME -Name vim-init -Value $viminit -ItemType Junction

# Vim-Plugの初期設定
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
