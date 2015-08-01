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
    @work_details = WorkDetail.where(["user_id = ? and work_id = ?", params[:user_id], params[:work_id]])
    @work = Work.find(params[:work_id])
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

      if @work_detail.save
        redirect_to new_user_work_work_details_path(user_id: @work_detail.user_id, work_id: @work_detail.work_id),as: :post
      else
        render :new
      end
  end

  # PATCH/PUT /work_details/1
  # PATCH/PUT /work_details/1.json
  # ここでは各細かい作業に関してcompletionをtrueにする
  def update
    @work_detail = WorkDetail.find_by(id: params[:id], user_id: params[:user_id], work_id: params[:work_id])

    @work_detail.completion = true
      if @work_detail.save
        # update for users
        works_true = WorkDetail.where(["user_id = ? and work_id = ? and completion = ?", params[:user_id], params[:work_id], true])
        works_false = WorkDetail.where(["user_id = ? and work_id = ? and completion = ?", params[:user_id], params[:work_id], false])
        percentage = (works_true.count.to_f / (works_true.count.to_f + works_false.count.to_f) * 100).to_i
        work = Work.find_by(id: params[:work_id], user_id: params[:user_id])
        work.entire_percent = percentage
        work.save
        redirect_to user_path(id: @work_detail.user_id, page: params[:page])
      else
        render :edit
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
