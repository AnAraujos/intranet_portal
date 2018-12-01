class EmployeeDetail < ApplicationRecord
  belongs_to :employee_visa
  belongs_to :employee_asset, :foreign_key => "employee_asset_id"
  belongs_to :employee_situation
  belongs_to :user
  has_many :employee_jobs

  def self.find_supervisor
    self.where(employee_asset_id: 5).where(employee_situation_id: 1)
  end

  def label_for_employee
    "#{name}  #{surname}"
  end

  def label_for_employee_asset
    "#{name}  #{surname} - #{employee_asset.desc} "
  end

  def self.available_employee(asset_id, job_id)
      where("NOT EXISTS(SELECT 1 from employee_jobs where employee_details.id = employee_jobs.employee_detail_id and employee_jobs.job_id = #{job_id})").    
      where("employee_details.employee_asset_id = ?", asset_id).
      where("employee_details.employee_situation_id = ?", 1)

        
    end
end
