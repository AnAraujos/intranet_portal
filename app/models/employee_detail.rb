class EmployeeDetail < ApplicationRecord
  belongs_to :employee_visa
  belongs_to :employee_asset
  belongs_to :employee_situation
  belongs_to :user
end
