class ScanItemsController < ApplicationController
  before_action :set_scan_item, only: [:show, :edit, :update, :destroy]

  # GET /scan_items
  # GET /scan_items.json
  def index
    @scan_items = ScanItem.all
  end

  # GET /scan_items/1
  # GET /scan_items/1.json
  def show
  end

  # GET /scan_items/new
  def new
    @scan_item = ScanItem.new
  end

  # GET /scan_items/1/edit
  def edit
  end

  # POST /scan_items
  # POST /scan_items.json
  def create
    @scan_item = ScanItem.new(scan_item_params)

    respond_to do |format|
      if @scan_item.save
        format.html { redirect_to @scan_item, notice: 'Scan item was successfully created.' }
        format.json { render :show, status: :created, location: @scan_item }
      else
        format.html { render :new }
        format.json { render json: @scan_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_items/1
  # PATCH/PUT /scan_items/1.json
  def update
    respond_to do |format|
      if @scan_item.update(scan_item_params)
        format.html { redirect_to @scan_item, notice: 'Scan item was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_item }
      else
        format.html { render :edit }
        format.json { render json: @scan_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_items/1
  # DELETE /scan_items/1.json
  def destroy
    @scan_item.destroy
    respond_to do |format|
      format.html { redirect_to scan_items_url, notice: 'Scan item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan_item
      @scan_item = ScanItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_item_params
      params.require(:scan_item).permit(:spec_scan_id, :baseline_id, :upper, :lower, :time, :power)
    end
end
