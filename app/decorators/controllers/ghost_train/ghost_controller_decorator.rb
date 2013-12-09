GhostTrain::GhostController.class_eval do
  before_filter :authenticate_user!
  
  protected

  def get_uploader
    GhostUploader.new
  end

  def get_posts
    Posts.all.map{|x| x.munge_post}
  end

  def get_tags
    ActsAsTaggableOn::Tag.all.map{ |t| TagSerializer.new t}.to_json
  end

  def get_post(id)
    GhostPostSerializer.new  Post.find(id)
  end

  def update_post(params)
    return {}
  end

  def create_post(params)
    params[:state] = params[:status]
    params.delete(:status)
    Post.create(params)
    {"status"=>"draft", "tags"=>nil, "title"=>"asd", "markdown"=>"asdsad\n\nasd\n"}

    FactoryGirl.build(:ghost_post)
  end

  def munge_post(post)

  end
  
end