class GhostPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :markdown, :status, :published_at

  def status
    object.state
  end

  has_many :tags

end
