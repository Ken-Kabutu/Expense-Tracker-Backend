class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :update]

  # GET /incomes.json
  def index
    incomes = current_user.incomes
    render json: incomes
  end

  # GET /incomes/1.json
  def show
    render json: @income
  end

  # POST /incomes.json
  def create
    income = current_user.incomes.build(income_params)
    if income.save
      render json: income, status: :created
    else
      render json: income.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incomes/1.json
  def update
    if @income.update(income_params)
      render json: @income
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  # DELETE /incomes/1.json
  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_income
    @income = current_user.incomes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Income not found or you don't have permission to access it" }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def income_params
    params.require(:income).permit(:id, :title, :description, :amount, :date, :income_type, :category)
  end
end
