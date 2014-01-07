class GistSerializer < ActiveModel::Serializer
  attributes :id, :gist_id

  has_many :tags
end
