class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def show
    redirect_to new_user_work_work_details_path(@work_detail, user_id: @work.user_id, work_id: @work.id),as: :post
  end

  def new
    @work = Work.new
    @work.user_id = params[:user_id]
  end

  def edit
  end

  def create
    @work = Work.new(work_params)

      if @work.save
        redirect_to user_work_path(@work, user_id: @work.user_id)
      else
        render :new
      end
  end

  private
    def set_work
      @work = Work.find(params[:id])
    end

    def work_params
      params.require(:work).permit(:user_id, :title, :content, :begin_time, :end_time, :entire_percent)
    end
end

