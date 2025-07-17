# INSERCION DE CÓDIGO DE CHEF PARA INSTALAR NOTEPAD++

# Instala Notepad++
execute 'Instalar Notepad' do
  command 'choco install -y notepadplusplus'
  action :run
  not_if 'choco list --local-only | findstr notepadplusplus'
end

# Avisa que Notepad++ fue instalado correctamente
log 'notepad_instalado' do
  message 'Notepad++ fue instalado correctamente en Windows'
  level :info
end