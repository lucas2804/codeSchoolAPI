require 'test_helper'

class CreatingCrawlersTest < ActionDispatch::IntegrationTest
  test 'creates new crawler with valid data' do
    post '/api/crawlers',
         {crawler: {url: "http://google.com", h1_content: "H1 in google.com"}}.to_json,
         {Accept: 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    crawler = JSON.parse(response.body, symbolize_names: true)
    assert_equal api_crawler_url(crawler[:id]), response.location
    assert_equal "http://google.com", crawler[:url]
  end

  test 'does not creates crawler with INVALID data' do
    post '/api/crawlers',
         {crawler: {url: "", h1_content: "H1 in google.com"}}.to_json,
         {Accept: 'application/json', 'Content-Type' => 'application/json'}
    assert_equal 422, response.status
  end
end
