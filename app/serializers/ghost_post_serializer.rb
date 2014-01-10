class GhostPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :markdown, :status, :published_at, :thumbnail

  def status
    object.state
  end

  has_many :tags

end
