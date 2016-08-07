# codeSchoolAPI

codeSchoolAPI is web crawler with valid URL, provide 2 APIs and basic structure when work with API:

1 - API:    localhost:3000/api/crawl_data
    params: crawler[[url]] (http://sandimetz.com)
          
2 - API:    localhost:3000/api/crawlers
    

## Scraping a page:

The simplest way to custom which data need to crawl:

File 
```ruby
  def crawl_data
    data = Nokogiri::HTML(open(url))
    self.h1_content = data.css('h1').text
    self.h2_content = data.css('h2').text
    self.h3_content = data.css('h3').text
    self.link_content = data.css('a').map { |link| link['href'] }
  end
```

###### Custom Data Response in crawler._serializer.rb

You can embed ids, or relations for response ([@active_model_serializers](https://github.com/rails-api/active_model_serializers))

```ruby
class CrawlerSerializer < ActiveModel::Serializer
  attributes :id, :url, :link_content, :h1_content, :h2_content, :h3_content, :term
end
```

## Contributors
 * codeschool.com (Surviving APIs with Rails Courses) ([@codeschool.com](http://codeschool.com)) 

## Copyright

