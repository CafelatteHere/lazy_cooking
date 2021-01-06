class CalendarsController < ApplicationController
  require "time"
  now = Time.new
  def index
    now = Time.new
    @month = now.month
    @day = now.day
    @i = now.wday
    @wdays = ['日', '月', '火', '水', '木', '金', '土']
    @wday = @wdays[@i]
  end

  def search
    return nil if params[:keyword] == ""
    recipe = Recipe.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: recipe }
  end


  private

end
