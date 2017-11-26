class CalendarController < ApplicationController 
  include ApplicationHelper

  before_action :set_years_and_months, only: [:index]
  
  def index
    params[:q] ||= {}
    params[:year] = params[:year] || Time.current.year
    params[:month] = params[:month] || Time.current.month

    @date = "#{params[:year]}-#{params[:month]}-01".to_date
    
    params[:q][:due_date_gteq] = @date.beginning_of_month
    params[:q][:due_date_lteq] = @date.end_of_month
    
    @search = Task.search(params[:q])
    @tasks = @search.result :distinct=>true
  #  @tasks = @tasks.paginate(page: params[:page], per_page: 500)
    @tasks_by_date = @tasks.group_by(&:task_date)
  end
  
  private 

  def set_years_and_months
    result = get_year_month_ranges
    @months_range = result[:months]    
    @years_range = result[:years]
  end
end



