class Api::V1::ExpensesController < ApplicationController

    before_action :set_expense, only: [:show, :update, :destroy]

    def index
        @expenses = Expense.all
        render json: @expenses
    end

    def create
        @expense = Expense.new(expense_params)
        if @expense.save
            render json: { success: true, expense_id: @expense.id }
        else
            render json: { success: false }            
        end
    end

    def update
        if @expense.update(expense_params)
            render json: { success: true }
        else
            render json: { success: false }
        end
    end

    def show
        render json: @expense
    end

    def destroy
        if @expense.destroy
            render json: { success: true }
        else
            render json: { success: false }
        end
    end

    private
    
    def set_expense
        @expense = Expense.find(params[:id])
    end

    def expense_params
        params.require(:expense).permit(:type, :date_expense, :concept, :category, :amount)
    end
end