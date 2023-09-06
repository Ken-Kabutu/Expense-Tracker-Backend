class IncomeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :amount, :date, :income_type, :category
end
