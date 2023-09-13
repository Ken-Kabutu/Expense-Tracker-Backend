class IncomesController < ApplicationController
  def index
    @incomes = @current_user.incomes
    render json: @incomes
  end

  def show
    render json: @income
  end

  def create
    income = @current_user.incomes.create!(income_params)
    render json: income, status: :created
  end

  def update
    if @income.update(income_params)
      render json: @income
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @income.destroy
  end

  private

  def income_params
    params.permit(:title, :amount, :date, :source, :description)
  end
end
