# INSTALACION DE FIREFOX EN WINDOWS

execute 'Instalar Firefox' do
  command 'choco install -y firefox'
  action :run
  not_if 'choco list --local-only | findstr firefox'
end

# Avisa que Firefox fue instalado correctamente
log 'firefox_instalado' do
  message 'Firefox fue instalado correctamente en Windows'
  level :info
end