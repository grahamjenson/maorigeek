class GhostPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :markdown, :status

  def status
    object.state
  end

  has_many :tags

end
