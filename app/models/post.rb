class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  before_create :create_uuid
  before_save :generate_slug

  accepts_nested_attributes_for :tags

  scope :drafts, ->{ where(:state => :draft) }
  scope :published, ->{ where(:state => :published) }
  
  scope :recent, ->{published.order('published_at DESC')}
  

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

  def renderer
     Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end

  def rendered_markdown
    renderer.render(self.markdown)
  end

  def rendered_description
    renderer.render(self.description)
  end

  def description
    self.markdown.split(/<!\-*\s*FOLD\s*\-*>/)[0]
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
    self.slug = self.title.dup.slugorize! if !self.published?
  end

  def create_uuid
      self.uuid = SecureRandom.uuid # or whatever you chose like UUID tools
  end

  def pretty_published_at_date
    published_at.strftime("#{published_at.day.ordinalize} %B %Y")
  end


end
