class Fund < ApplicationRecord
  validates :institution, :name, :description, :amount, :start, :end, :url, presence: true
  validates :start, :end, presence: true
  after_create :find_tags
  require "google/cloud/language"
  has_many :fund_tags
  has_many :tags, through: :fund_tags
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :fund_tags

  def title
    name
  end

  def find_tags
    language = Google::Cloud::Language.new({credentials: JSON.parse(ENV['GOOGLE_APPLICATION_CREDENTIALS'])})
    response = language.analyze_entities content: description, type: :PLAIN_TEXT, language: 'es'
    tags = response.to_h[:entities].map{|k| k[:name]}
    add_tags(tags)
  end

  def add_tags(tags = [])
    fund = self
    tags.each do |tag|
      tag = Tag.find_or_create_by(name: tag)
      FundTag.create(fund_id: fund.id, tag_id: tag.id)
    end
  end
end
