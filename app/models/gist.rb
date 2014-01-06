class Gist < ActiveRecord::Base
  scope :recent, ->{order('created_at DESC')}
end
