class Gist < ActiveRecord::Base
  scope :recent, ->{order('created_at DESC')}

  acts_as_taggable_on :tags
  
  def self.tags
    ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.taggable_type = 'Gist'").distinct('tag.id')
  end
end
