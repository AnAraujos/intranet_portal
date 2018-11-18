class EmployeeDetailsController < ApplicationController
  before_action :set_employee_detail, only: [:show, :edit, :update, :destroy]

  # GET /employee_details
  # GET /employee_details.json
  def index
    @employee_details = EmployeeDetail.all
  end

  # GET /employee_details/1
  # GET /employee_details/1.json
  def show
  end

  # GET /employee_details/new
  def new
    @employee_detail = EmployeeDetail.new
  end

  # GET /employee_details/1/edit
  def edit
  end

  # POST /employee_details
  # POST /employee_details.json
  def create

    @employee_detail = EmployeeDetail.new(employee_detail_params)
    @email = params[:employee_detail][:email]
    @employee_number = params[:employee_detail][:employee_number]
    @admin = params[:employee_detail][:admin]
    if (User.exists?(:email => params[:employee_detail][:email]) or User.exists?(:employee_id => params[:employee_detail][:employee_number]))
      if User.exists?(:email => params[:employee_detail][:email])
        @employee_detail.errors.add(:email, 'already exists!')
      end
      if User.exists?(:employee_id => params[:employee_detail][:employee_number])
        @employee_detail.errors.add(:employee_number, 'already exists!')
      end 
      render "new"
    else

    createUser
    @user = User.find_by_email(params[:employee_detail][:email])
    
    @employee_detail.user_id = @user.id
    respond_to do |format|
      if @employee_detail.save
        format.html { redirect_to @employee_detail, notice: 'Employee detail was successfully created.' }
        format.json { render :show, status: :created, location: @employee_detail }
      else
        format.html { render :new }
        format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
      end
    end
  end
    

    
  end

  def createUser
    
    password = SecureRandom.hex(4)
    email = params[:employee_detail][:email]
    employee_number = params[:employee_detail][:employee_number]
    admin  = params[:employee_detail][:admin]
    user = User.new(employee_id: employee_number, email: email, admin: admin, password: password, password_confirmation: password)
    user.save ? true : user.errors
    User.send_email_to_users(user)
  
  end

 # PATCH/PUT /employee_details/1
  # PATCH/PUT /employee_details/1.json
  def update
    respond_to do |format|
      if @employee_detail.update(employee_detail_params)
        format.html { redirect_to @employee_detail, notice: 'Employee detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_detail }
      else
        format.html { render :edit }
        format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_details/1
  # DELETE /employee_details/1.json
  def destroy
    @employee_detail.destroy
    respond_to do |format|
      format.html { redirect_to employee_details_url, notice: 'Employee detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_detail
      @employee_detail = EmployeeDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_detail_params
      params.require(:employee_detail).permit(:name, :surname, :phone_number, :address_1, :address_2, :employee_visa_id, :employee_asset_id, :employee_situation_id, :user_id, :dt_entry, :dt_leave)
    end
end
