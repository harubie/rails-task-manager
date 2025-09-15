class TasksController < ApplicationController
  def index
    # 1. Grab all tasks from DB
    # 2. Render all the tasks on the view
    @tasks = Task.all
  end

  # GET /tasks/:id
  def show
    # 1. Grab the task with id of params[:id]
    @task = Task.find(params[:id])
    # 2. Display this information in the view
  end

  # GET /tasks/new (Displaying form)
  def new
    # Display the page for creating new task
    @task = Task.new
  end

  # POST /tasks (Submitting form)
  def create
    # 1. Create an instance of Task with data from form (params)
    @task = Task.new(task_params)
    # 2. Save the record
    @task.save
    # 3. Redirect user to new task page
    redirect_to "/tasks/#{@task.id}"
  end

  # GET /tasks/:id/edit
  def edit
    # 1. Grab the task we are updating (from DB)
    @task = Task.find(params[:id])
    # 2. Display the view (With form)
  end

  # PATCH /tasks/:id
  def update
    # 1. Find task with id
    @task = Task.find(params[:id])
    # 2. Update the task with values from form
    @task.update(task_params)
    # 3. Redirect to the root path
    redirect_to tasks_path
  end

  def destroy
    # 1. Grab the task we are deleting (from DB)
    @task = Task.find(params[:id])
    # 2. Delete the task
    @task.destroy
    # 3. Redirect to task path
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
