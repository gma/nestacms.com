Encoding.default_external = 'utf-8'

Tilt.prefer Tilt::MarukuTemplate

module Nesta
  class App
    def author_biography(name = nil)
      name ||= @page.metadata('author')
      if name
        short_name = name.downcase.gsub(/\W+/, '_').to_sym
        avatar_path = File.join(['images', 'authors', "#{short_name}.jpg"])
        html = ""
        locals = { :has_avatar => false }
        if File.exist?(File.join(Nesta::App.root, 'public', avatar_path))
          html += capture_haml do
            haml_tag :img, :src => "/#{avatar_path}", :class => 'avatar'
          end
          locals[:has_avatar] = true
        end
        html << haml(short_name.to_sym, :layout => false, :locals => locals)
      end
    end
  end
end
