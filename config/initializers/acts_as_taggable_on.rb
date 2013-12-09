ActsAsTaggableOn::Tag.class_eval do
  before_create :create_uuid

  def create_uuid
      self.uuid = SecureRandom.uuid # or whatever you chose like UUID tools
  end
end
