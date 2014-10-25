class NotebooksController < ApplicationController
  def new
    @notebook = new_notebook
  end

  def create
    @notebook = current_user.notebooks.build(notebook_params)
    @notebook.save!

    redirect_to root_path, notice: "Notebook created"

  rescue ActiveRecord::RecordInvalid
    # not implemented yet
  end

  private

  def new_notebook
    Notebook.new
  end

  def notebook_params
    params.require(:notebook).permit(:name, :description)
  end
end
