GhostTrain::GhostController.class_eval do
  before_filter :authenticate_user!
  
  protected

  def get_uploader
    GhostUploader.new
  end

  def get_posts
    Post.all.order('updated_at DESC').map{|x| GhostPostSerializer.new(x)}.to_json
  end

  def get_tags
    ActsAsTaggableOn::Tag.all.map{ |t| TagSerializer.new t}.to_json
  end

  def get_post(id)
    GhostPostSerializer.new(Post.find(id)).to_json
  end

  def update_post(id, params)
    p = ghost_post_params(Post.find(id),params)
    p.save
    GhostPostSerializer.new(p).to_json
  end

  def create_post(params)
    #return  {"error" => "You do not have permission to fjdsfjodsfdsjofadd posts." }.to_json
    p = ghost_post_params(Post.new, params)
    p.save
    GhostPostSerializer.new(p).to_json
  end
  
  def ghost_post_params(post, params)
    params.delete(:id)

    #Handle state
    state = params[:status]
    params.delete(:status)
    handle_state(post, state)

    #handle tags
    tag_list = params[:tags].map{|x| x[:name]}.join(', ') if params[:tags]
    params.delete(:tags)
    handle_tag_list(post, tag_list)


    params = params.permit(:title, :markdown, :state, :thumbnail)
    post.assign_attributes(params)
    
    post
  end

  def handle_tag_list(post, tag_list)
    post.tag_list = tag_list
  end

  def handle_state(post, state)
    return if post.state == state

    #TODO simple for now
    if state == 'published'
      post.publish
    elsif state == 'draft'
      post.unpublish
    end
    
  end

  def get_messages
    @messages || []
  end
end