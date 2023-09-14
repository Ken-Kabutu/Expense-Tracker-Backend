class User < ApplicationRecord
    has_secure_password
    has_many :incomes
    has_many :expenses
end
