class BudgetItemsController < ApplicationController
  def new
    @notebook = notebook
    @budget_item = new_budget_item
  end

  def create
    @budget_item = notebook.budget_items.build(budget_item_params)
    @budget_item.save!

    redirect_to root_path, notice: "New budget item added to #{notebook.name}"

  rescue ActiveRecord::RecordInvalid
    # not implemented yet
  end

  private

  def budget_item_params
    params.require(:budget_item).
      permit(:name, :amount)
  end

  def notebook
    current_user.notebooks.find(params[:notebook_id])
  end

  def new_budget_item
    BudgetItem.new
  end
end
