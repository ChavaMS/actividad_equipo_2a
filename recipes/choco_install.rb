powershell_script 'install_chocolatey' do
  code <<-EOH
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  EOH
  not_if { ::File.exist?('C:/ProgramData/chocolatey/bin/choco.exe') }
end

# Agrega chocolatey al PATH de la sesión actual (por si Chef lo necesita)
ENV['PATH'] += ";C:\\ProgramData\\chocolatey\\bin"

