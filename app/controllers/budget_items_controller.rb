class BudgetItemsController < ApplicationController

  def new
    @budget_item = new_budget_item
  end

  private

  def notebook
    current_user.notebooks.find(params[:id])
  end

  def new_budget_item
    BudgetItem.new
  end
end
