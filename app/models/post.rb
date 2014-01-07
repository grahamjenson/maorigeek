class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  before_create :create_uuid
  before_save :generate_slug

  accepts_nested_attributes_for :tags

  scope :drafts, ->{ where(:state => :draft) }
  scope :published, ->{ where(:state => :published) }
  
  scope :recent, ->{published.order('created_at DESC')}
  

  state_machine :initial => :draft do

    state :published do
    end

    state  :draft do
    end

    before_transition :on => :publish, :do => :set_published_at_state
    before_transition :on => :unpublish, :do => :unset_published_at_state

    event :publish do
      transition :draft => :published
    end

    event :unpublish do
      transition :published => :draft
    end
  end

  def unset_published_at_state
    self.published_at = nil
    save
  end

  def set_published_at_state
    self.published_at = Time.now
    save #TODO find better way than saving twice
  end

  def generate_slug
    self.slug = self.title.dup.slugorize!
  end

  def create_uuid
      self.uuid = SecureRandom.uuid # or whatever you chose like UUID tools
  end



end
