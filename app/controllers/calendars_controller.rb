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
end
