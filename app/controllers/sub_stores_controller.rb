class SubStoresController < ApplicationController
  before_action :set_sub_store, only: [:show, :edit, :update, :destroy]

  # GET /sub_stores
  # GET /sub_stores.json
  def index
    @sub_stores = SubStore.all
  end

  # GET /sub_stores/1
  # GET /sub_stores/1.json
  def show
  end

  # GET /sub_stores/new
  def new
    @sub_store = SubStore.new
  end

  # GET /sub_stores/1/edit
  def edit
  end

  # POST /sub_stores
  # POST /sub_stores.json
  def create
    @sub_store = SubStore.new(sub_store_params)

    respond_to do |format|
      if @sub_store.save
        format.html { redirect_to @sub_store, notice: 'Sub store was successfully created.' }
        format.json { render :show, status: :created, location: @sub_store }
      else
        format.html { render :new }
        format.json { render json: @sub_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_stores/1
  # PATCH/PUT /sub_stores/1.json
  def update
    respond_to do |format|
      if @sub_store.update(sub_store_params)
        format.html { redirect_to @sub_store, notice: 'Sub store was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_store }
      else
        format.html { render :edit }
        format.json { render json: @sub_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_stores/1
  # DELETE /sub_stores/1.json
  def destroy
    @sub_store.destroy
    respond_to do |format|
      format.html { redirect_to sub_stores_url, notice: 'Sub store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_store
      @sub_store = SubStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_store_params
      params.require(:sub_store).permit(:number, :store_id, :unit_qtd, :contact_manager, :phone, :address)
    end
end
