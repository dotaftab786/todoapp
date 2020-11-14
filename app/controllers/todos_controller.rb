class TodosController < ApplicationController
  before_action :set_todo,only:[:edit,:update,:destroy,:show]
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Data save into database"
      redirect_to todo_path(@todo)
    else
      render "new"
    end
  end
  def index
    @todos = Todo.all
  end
  def show
  end

  def edit
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Todos deleted successfully"
    redirect_to todos_path(@todos)
  end
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todos update successfully"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end
  private
  def set_todo
    @todo = Todo.find(params[:id])
  end
  def todo_params
    params.require(:todo).permit(:name,:description)
  end
end