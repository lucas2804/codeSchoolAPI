class CrawlerSerializer < ActiveModel::Serializer
  attributes :id, :url, :h1_content, :h2_content, :h3_content, :term
end
