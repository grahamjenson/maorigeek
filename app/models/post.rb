class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  before_save :generate_slug

  def generate_slug
    self.slug = self.title.dup.slugorize!
  end

end
