class BaselinesController < ApplicationController
  before_action :set_baseline, only: [:show, :edit, :update, :destroy]

  # GET /baselines
  # GET /baselines.json
  def index
    @baselines = Baseline.all
  end

  # GET /baselines/1
  # GET /baselines/1.json
  def show
  end

  # GET /baselines/new
  def new
    @baseline = Baseline.new
  end

  # GET /baselines/1/edit
  def edit
  end

  # POST /baselines
  # POST /baselines.json
  def create
    @baseline = Baseline.new(baseline_params)

    respond_to do |format|
      if @baseline.save
        format.html { redirect_to @baseline, notice: 'Baseline was successfully created.' }
        format.json { render :show, status: :created, location: @baseline }
      else
        format.html { render :new }
        format.json { render json: @baseline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baselines/1
  # PATCH/PUT /baselines/1.json
  def update
    respond_to do |format|
      if @baseline.update(baseline_params)
        format.html { redirect_to @baseline, notice: 'Baseline was successfully updated.' }
        format.json { render :show, status: :ok, location: @baseline }
      else
        format.html { render :edit }
        format.json { render json: @baseline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baselines/1
  # DELETE /baselines/1.json
  def destroy
    @baseline.destroy
    respond_to do |format|
      format.html { redirect_to baselines_url, notice: 'Baseline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baseline
      @baseline = Baseline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baseline_params
      params.require(:baseline).permit(:status, :job_id)
    end
end
