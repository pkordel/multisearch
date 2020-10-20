class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, except: [:index]

  def index
    @title = 'Reports'
    @reports = current_user.reports
  end

  def show
    @title = 'Search results'
  end

  def new
    @title = 'New report'
  end

  def create
    @report = current_user.reports.new(report_params)
    if @report.save
      redirect_to reports_path
    else
      render :new
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

  def set_report
    @report = current_user.reports.find_by(id: params[:id]) || current_user.reports.build
    @results = @report.search_results
  end

  def report_params
    params.require(:report).permit(:title, :keyword_list)
  end
end
