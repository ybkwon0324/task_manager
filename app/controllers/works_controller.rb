class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def show
  end

  def new
    @work = Work.new
    @work.user_id = params[:user_id]
  end

  def edit
  end

  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to user_work_path(@work, user_id: @work.user_id), notice: 'Work was successfully created.' }
      else
        format.html { render :new }
      end
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

