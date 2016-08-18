class ProjectsController < ApplicationController
  before_action :set_project, only: [:baseline, :scan, :show, :edit, :update, :destroy]




  def baseline 
    b = Baseline.create!(:project_id => @project.id)
    ScanWorker.perform_async("", b.id, "hackrf", "300M", "450M", "1M")
    redirect_to b, notice: "Wait a minute or so, and refresh the page"
  end

  def scan 
    s = SpecScan.create!(:project_id => @project.id)
    ScanWorker.perform_async(s.id, "", "hackrf", "300M", "450M", "1M")
    redirect_to s, notice: "Wait a minute or so, and refresh the page"
  end


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      if params[:id].present?
        @project = Project.find(params[:id])
      else
        @project = Project.find(params[:project_id]) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :min_freq, :max_freq, :device, :bin_size, :notes)
    end
end
