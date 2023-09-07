class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses
  def index
    @expenses = Expense.all
    render json: @expenses
  end

  # GET /expenses/1
  def show
    render json: @expense
  end

  # POST /expenses
  def create
    expenses = Expense.new(expense_params)
    if income.save
      render json: expenses, status: :created
    else
      render json: expenses.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    # Define the allowed expense parameters
    params.require(:expense).permit(:description, :category, :date)
  end
end
