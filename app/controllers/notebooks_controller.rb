class NotebooksController < ApplicationController
  def new
    @notebook = new_notebook
  end

  def show
    @notebook = notebook
  end

  def create
    @notebook = current_user.notebooks.build(notebook_params)
    @notebook.save!

    redirect_to root_path, notice: "Notebook created"

  rescue ActiveRecord::RecordInvalid
    redirect_to root_path, alert: @notebook.errors.full_messages.to_a.uniq
  end

  private

  def new_notebook
    Notebook.new
  end

  def notebook
    current_user.notebooks.find(params[:id])
  end

  def notebook_params
    params.require(:notebook).permit(:name, :description)
  end
end
