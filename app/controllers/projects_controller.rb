class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    render :json => @projects.to_json(:include => [:todos], :except => [:created_at, :updated_at])
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
      render :json => @project.to_json()
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, tasks_attributes: [:id, :text, :isComplited])
    end
end
