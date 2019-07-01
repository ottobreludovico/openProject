class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /user_stories
  # GET /user_stories.json
  def index
    @user_stories = UserStory.all
  end

  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
  end

  # GET /user_stories/1/edit
  def edit
    @description = UserStory.find(params[:id]).description
  end

  # POST /user_stories
  # POST /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)

    respond_to do |format|
      if @user_story.save
        format.html { }
        format.json { render :json => {:user_story => @user_story,
                                       :user_story_id => @user_story.id}
        }
      else
        format.html { render :new }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1
  # PATCH/PUT /user_stories/1.json
  def update
    @p = UserStory.find(params[:id]).project_id
    respond_to do |format|
      if @user_story.update(user_story_params)
        format.html { redirect_to controller: 'projects', action: 'us', id: @p}
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /user_stories/1
  # DELETE /user_stories/1.json
  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_params
      params.require(:user_story).permit(:project_id,:worker_id, :description, :deadline, :creator_id, :title, :state)
    end

    
end
