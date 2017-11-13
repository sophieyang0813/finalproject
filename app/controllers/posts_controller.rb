class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :require_login, only: [:edit,:update,:destroy]

  #sort the posts 
  helper_method :sort_column, :sort_direction

  # GET /posts
  # GET /posts.json

  def index
    if params[:state] || params[:town]

      @posts = Post.search(params[:state] ,params[:town])

    else
      @posts = Post.all.order(sort_column + ' ' + sort_direction)

    end



    
    


   @posts = Post.all.order(sort_column + ' ' + sort_direction)
   @a = [];
   @posts.each do |post|
    if post.supporter.latitude != nil && post.supporter.longitude != nil
      @a << [post.supporter.latitude, post.supporter.longitude]
    end

  end
end


  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create

    @post = Post.new(post_params)
    @post.supporter_id = current_user.id 

    #test-email
    # @charity = "pairbnbtesttest@gmail.com"

    respond_to do |format|
      if @post.save

        # Tell the UserMailer to send a welcome email after save
        # Charity.all.each do |c| 

          NewpostMailer.notification_email('foodloveshareproject@gmail.com', @post.supporter.last_name, @post.id).deliver_later

        # end

        format.html { redirect_to (posts_url), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :created, location: @post }


      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (posts_url), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to (posts_url), notice: 'Post was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :pickup_start, :pickup_end, :deadline_for_collection,:description, photos: [])
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end

    def sort_column
      Post.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end


  end
