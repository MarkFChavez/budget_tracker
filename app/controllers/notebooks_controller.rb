class NotebooksController < ApplicationController
  def new
    @notebook = new_notebook
  end

  private

  def new_notebook
    Notebook.new
  end
end
