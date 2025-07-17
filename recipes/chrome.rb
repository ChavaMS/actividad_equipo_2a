# INSTALACION DE GOOGLE CHROME EN WINDOWS Y UNA EXTENSION

chrome_installer = 'C:/Windows/Temp/chrome_installer.exe'

# Descarga el instalador de Chrome
remote_file chrome_installer do
  source 'https://dl.google.com/chrome/install/latest/chrome_installer.exe'
  action :create
end

# Instala Chrome
execute 'Install Chrome' do
  command "#{chrome_installer} /silent /install"
  action :run
  not_if { ::File.exist?('C:/Program Files/Google/Chrome/Application/chrome.exe') }
end

# Forza instalación de la extensión uBlock Origin
registry_key 'HKLM\\Software\\Policies\\Google\\Chrome' do
  action :create
  recursive true
end

registry_key 'HKLM\\Software\\Policies\\Google\\Chrome\\ExtensionInstallForcelist' do
  values [{
    name: '1',
    type: :string,
    data: 'cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx'
  }]
  action :create
end
