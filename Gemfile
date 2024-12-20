source "https://rubygems.org"

# Gemas necesarias para Jekyll
gem "jekyll", "~> 4.3.2" # Última versión estable de Jekyll
gem "faraday-retry"      # Dependencia adicional personalizada
gem 'webrick'

# Dependencias estándar de Ruby para evitar advertencias
gem "csv"                # Elimina advertencia sobre la futura exclusión de CSV
gem "base64"             # Elimina advertencia sobre la futura exclusión de Base64

# Plugins personalizados
group :jekyll_plugins do
  gem "jekyll-paginate"  # Si necesitas paginación (opcional)
end

# Windows y JRuby: soporte adicional
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Booster de rendimiento para Windows
gem "wdm", "~> 0.1", platforms: [:mingw, :x64_mingw, :mswin]