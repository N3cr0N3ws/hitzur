module Jekyll
  class PageGenerator < Generator
    safe false

    def generate(site)
      Jekyll.logger.info "PageGenerator:", "Plugin 'generate_page.rb' cargado correctamente."

      # Leer los datos desde _data/source.json
      articles = site.data['source']

      # Validar si los datos existen
      if articles.nil? || articles.empty?
        Jekyll.logger.warn "PageGenerator:", "No se encontraron datos en '_data/source.json'."
        return
      end

      # Mensaje de artículos encontrados
      Jekyll.logger.info "PageGenerator:", "Se encontraron #{articles.size} artículos para procesar."

      # Generar una página para cada artículo
      articles.each do |article|
        # Validar el título para generar un slug
        if article['titular'].nil? || article['titular'].strip.empty?
          Jekyll.logger.warn "PageGenerator:", "Artículo omitido porque no tiene un 'titular'."
          next
        end

        # Crear el slug a partir del título
        slug = slugify(article['titular'])

        # Crear y agregar la página al sitio
        page = DataPage.new(site, site.source, article, slug)
        site.pages << page

        # Mensaje de éxito
        Jekyll.logger.info "PageGenerator:", "Página generada para: '#{article['titular']}' (Slug: #{slug})"
      end

      # Mensaje final
      Jekyll.logger.info "PageGenerator:", "Generación de páginas completada."
    end

    # Función para generar slugs
    def slugify(string)
      # Manejar casos donde el título sea nil o vacío
      return "sin-titulo" if string.nil? || string.strip.empty?

      # Generar el slug normalizado
      string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  # Clase para crear las páginas
  class DataPage < Page
    def initialize(site, base, article, slug)
      @site = site
      @base = base
      @dir = "pages" # Directorio donde se guardarán las páginas
      @name = "#{slug}.html" # Nombre del archivo basado en el slug

      self.process(@name)
      self.data ||= {}

      # Metadatos
      self.data['layout'] = "page" # Layout que usará `page.html`
      self.data['slug'] = slug # Agregar el slug para que esté disponible en el layout
      self.data['titular'] = article['titular'] || "Sin título" # Titular del artículo
      self.data['categoria_emocional'] = article['categoria_emocional'] || "Sin categoría emocional"
      self.data['date'] = article['fecha_publicacion'] || "Fecha no disponible"
      self.data['url_canonical'] = article['url_canonical'] || ""
      self.data['url_imagen'] = article['url_imagen'] || ""
      self.data['resumen'] = article['resumen'] || "Sin resumen disponible"
      self.data['contexto'] = article['contexto'] || "Sin contexto disponible"
      self.data['linea_tiempo'] = article['linea_tiempo'] || []
      self.data['posibles_proximos_pasos'] = article['posibles_proximos_pasos'] || []
      self.data['quien_es_quien'] = article['quien_es_quien'] || []
      self.data['glosario_terminos'] = article['glosario_terminos'] || []
      self.data['impacto_esperado'] = article['impacto_esperado'] || []
      self.data['comparativas'] = article['comparativas'] || []
      self.data['opinion_publica'] = article['opinion_publica'] || []
      self.data['datos_relevantes'] = article['datos_relevantes'] || []
      self.data['chequeo_datos'] = article['chequeo_datos'] || []
      self.data['reflexion_breve'] = article['reflexion_breve'] || []
    end
  end
end