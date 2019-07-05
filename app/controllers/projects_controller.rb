class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.search(params[:search])
  end

  def us
    @idUser = 1
		@idProject = params[:id]
		@project = Project.find(params[:id])
    	@participants = Join.where('project_id = ?', params[:id]).where('accepted = ?', 1)
    	if current_user.present?
	      @member = Join.where('project_id = ?', params[:id]).where('user_id = ?', current_user.id).where('accepted = ?', 1)
	      if @member.present?
	        @isMember = true
	      else
	        @isMemeber = false
	      end
	    else
	      @isMemeber = false
	    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #@components = Join.joins("INNER JOIN users ON joins.user_id = users.id INNER JOIN projects ON projects.id = joins.project_id").select("users.first_name")
    @currentuser=current_user.id
    @stories = Project.find(params[:id]).user_stories

    @participants = Join.where('project_id = ?', params[:id]).where('accepted = ?', 1)
    if current_user.present?
      @member = Join.where('project_id = ?', params[:id]).where('user_id = ?', current_user.id).where('accepted = ?', 1)
      if @member.present?
        @isMember = true
      else
        @isMemeber = false
      end
    else
      @isMemeber = false
    end
    @waiting = Join.where('project_id = ?', params[:id]).where('user_id = ?', current_user.id).where('accepted = ?', 0)
    @requests = Join.where('project_id = ?', params[:id]).where('accepted = ?', 0)

    respond_to do |format|
      format.html {  }
      format.json { render :json => {:stories => @stories,
                                     :currentuser => @currentuser}
      }
    end
  end

  def editRequest
    @request = Join.find(params[:request])
    if(params[:status] == "0")
      @request.destroy
    else
      @request.accepted = 1
      @request.save
    end
  end

  def sendRequest
    @newReq = Join.new
    @newReq.user = current_user
    @newReq.project = Project.find(params[:id])
    @newReq.role = params[:role]
    @newReq.save
  end

  def removeMember
    p params
    @toRemove = Join.where('project_id = ?', params[:id]).where('user_id = ?', params[:member_id]).first
    @toRemove.destroy
  end

  # GET /projects/new
  def new
      @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    if current_user.advanceduser?
      @project =  current_user.projects.build(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to home_path, notice: 'Devi essere AdvancedUser' }
      end
    end
    
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:teamleader_id, :title, :description, :number_of_member)
    end
end
