class Day < ActiveHash::Base
  now = Time.new
  @day = now.day
  @i = now.wday
  @wdays = ['日', '月', '火', '水', '木', '金', '土', '日', '月', '火', '水', '木', '金', '土']

  self.data = [
    { id: 1, name: "今日　（#{@day}日 #{@wdays[@i]}曜日）"},
    { id: 2, name: "明日　（#{@day+1}日 #{@wdays[@i+1]}曜日）"},
    { id: 3, name: "明後日（#{@day+2}日 #{@wdays[@i+2]}曜日）"},
    { id: 4, name: "#{@day+3}日（#{@wdays[@i+3]}曜日）"},
    { id: 5, name: "#{@day+4}日（#{@wdays[@i+4]}曜日）"},
    { id: 6, name: "#{@day+5}日（#{@wdays[@i+5]}曜日）"},
    { id: 7, name: "#{@day+6}日（#{@wdays[@i+6]}曜日）"}
  ]
end
