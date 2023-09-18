class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses.json
  def index
    expenses = @current_user.expenses
    render json: expenses
  end

  # POST /expenses.json
  def create
    expense = @current_user.expenses.new(expense_params)
    if expense.save
      render json: expense, status: :created
    else
      render json: expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1.json
  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = @current_user.expenses.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Expense not found or you don't have permission to access it" }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:id, :title, :description, :amount, :date, :expense_type, :category)
  end
end
