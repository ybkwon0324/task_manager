class WorkDetailsController < ApplicationController
  before_action :set_work_detail, only: [:show, :edit, :update, :destroy]

  # GET /work_details
  # GET /work_details.json
  def index
    @work_details = WorkDetail.all
  end

  # GET /work_details/1
  # GET /work_details/1.json
  def show
  end

  # GET /work_details/new
  def new
    @work_detail = WorkDetail.new
    @work_detail.user_id = params[:user_id]
    @work_detail.work_id = params[:work_id]
  end

  # GET /work_details/1/edit
  def edit
  end

  # POST /work_details
  # POST /work_details.json
  def create
    @work_detail = WorkDetail.new(work_detail_params)

    respond_to do |format|
      if @work_detail.save
        format.html { redirect_to @work_detail, notice: 'Work detail was successfully created.' }
        format.json { render :show, status: :created, location: @work_detail }
      else
        format.html { render :new }
        format.json { render json: @work_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_details/1
  # PATCH/PUT /work_details/1.json
  def update
    respond_to do |format|
      if @work_detail.update(work_detail_params)
        format.html { redirect_to @work_detail, notice: 'Work detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_detail }
      else
        format.html { render :edit }
        format.json { render json: @work_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_details/1
  # DELETE /work_details/1.json
  def destroy
    @work_detail.destroy
    respond_to do |format|
      format.html { redirect_to work_details_url, notice: 'Work detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_detail
      @work_detail = WorkDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_detail_params
      params.require(:work_detail).permit(:user_id, :work_id, :content_detail, :completion)
    end
end
