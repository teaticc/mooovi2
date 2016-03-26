class Scraping

  def self.movie_urls
    links = []
    agent = Mechanize.new
    next_url = '/now/'

    while true do
      page = agent.get("http://eiga.com#{next_url}")
      linker = page.search('.m_unit h3 a')
      linker.each do |link|
        links << "http://eiga.com#{link[:href]}"
      end
      break unless page.at(".next_page")
      next_url = page.at(".next_page")[:href]
    end

    links.each do |link|
      get_product(link)

    end

  end

  def self.get_product(link)
    movie_page = Mechanize.new.get(link)
    movie_data = {}
    movie_data[:title] = "#{movie_page.search(".moveInfoBox h1").inner_text}"
    movie_data[:open_date] = "#{movie_page.search(".opn_date strong").inner_text}"
    movie_data[:image_url] = "#{movie_page.at(".pictBox img")[:src] if movie_page.at(".pictBox img")}"
    movie_data[:detail] = "#{movie_page.search(".outline p").inner_text}"
    movie_data[:director] = "#{movie_page.at(".staffBox dl dd a span").inner_text if movie_page.at(".staffBox dl dd a span")}"
    # binding.pry
    Product.where(movie_data).first_or_initialize.save
end

end