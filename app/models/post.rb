class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  before_create :create_uuid
  before_save :generate_slug

  accepts_nested_attributes_for :tags

  scope :drafts, ->{ where(:state => :draft) }
  scope :published, ->{ where(:state => :published) }
  
  scope :recent, ->{publisheds.order('created_at DESC')}
  

  state_machine :initial => :draft do

    state :published do
    end

    state  :draft do
    end

    event :publish do
      transition :draft => :published
    end
  end

  def generate_slug
    self.slug = self.title.dup.slugorize!
  end

  def create_uuid
      self.uuid = SecureRandom.uuid # or whatever you chose like UUID tools
  end



end
