class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_project
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /project/:id/todos
  def index
    @todos = @project.todos
    render :json => @todos.to_json(:except => [:created_at, :updated_at])
  end

  # POST /project/:id/todos
  def create
    @todo = @project.todos.build(todo_params)
    if @todo.save
      render :json => @project.to_json(:include => [:todos], :except => [:created_at, :updated_at])
    end
  end

  # PATCH/PUT /project/:id/todos/:id
  def update
    if @todo.update(todo_params)
      render :json => @todo.to_json()
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = @project.todos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:text, :isComplited, :project_id)
    end

    def get_project
      @project = Project.find(params[:project_id])
    end
end
