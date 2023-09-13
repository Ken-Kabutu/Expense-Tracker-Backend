class ExpensesController < ApplicationController
  def index
    @expenses = @current_user.expenses
    render json: @expenses
  end

  def show
    render json: @expense
  end

  def create
    expense = @current_user.expenses.create!(expense_params)
    render json: expense, status: :created
  end

  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
  end

  private

  def expense_params
    params.permit(:title, :amount, :date, :category, :description)
  end
end
