class SpecScansController < ApplicationController
  before_action :set_spec_scan, only: [:show, :edit, :update, :destroy]

  # GET /spec_scans
  # GET /spec_scans.json
  def index
    @spec_scans = SpecScan.all
  end

  # GET /spec_scans/1
  # GET /spec_scans/1.json
  def show
  end

  # GET /spec_scans/new
  def new
    @spec_scan = SpecScan.new
  end

  # GET /spec_scans/1/edit
  def edit
  end

  # POST /spec_scans
  # POST /spec_scans.json
  def create
    @spec_scan = SpecScan.new(spec_scan_params)

    respond_to do |format|
      if @spec_scan.save
        format.html { redirect_to @spec_scan, notice: 'Spec scan was successfully created.' }
        format.json { render :show, status: :created, location: @spec_scan }
      else
        format.html { render :new }
        format.json { render json: @spec_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spec_scans/1
  # PATCH/PUT /spec_scans/1.json
  def update
    respond_to do |format|
      if @spec_scan.update(spec_scan_params)
        format.html { redirect_to @spec_scan, notice: 'Spec scan was successfully updated.' }
        format.json { render :show, status: :ok, location: @spec_scan }
      else
        format.html { render :edit }
        format.json { render json: @spec_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spec_scans/1
  # DELETE /spec_scans/1.json
  def destroy
    @spec_scan.destroy
    respond_to do |format|
      format.html { redirect_to spec_scans_url, notice: 'Spec scan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec_scan
      @spec_scan = SpecScan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spec_scan_params
      params.require(:spec_scan).permit(:status, :job_id)
    end
end
