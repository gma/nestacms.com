Encoding.default_external = 'utf-8'

Tilt.prefer Tilt::MarukuTemplate

module Nesta
  class App
    helpers do
      def viewing_documentation?
        request.path =~ Regexp.new('^/docs/')
      end

      def viewing_blog?
        @page.metadata('date') || request.path =~ Regexp.new('^/(archives|blog)')
      end

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

      def list_articles(articles)
        haml_tag :ol do
          articles.each do |article|
            haml_tag :li do
              haml_tag :a, article.heading, :href => url(article.abspath)
            end
          end
        end
      end

      def article_years
        articles = Page.find_articles
        last, first = articles[0].date.year, articles[-1].date.year
        (first..last).to_a.reverse
      end

      def archive_by_year
        article_years.each do |year|
          haml_tag :li do
            haml_tag :a, :id => "#{year}"
            haml_tag :h2, year
            haml_tag :ol do
              list_articles(Page.find_articles.select { |a| a.date.year == year })
            end
          end
        end
      end
    end
  end
end
