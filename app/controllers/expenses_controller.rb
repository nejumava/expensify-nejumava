class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
  end

  private
  def expense_params
    params.require(:expense).permit(:type, :date_expense, :concept, :category, :amount)
  end

end
