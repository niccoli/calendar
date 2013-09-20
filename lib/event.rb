class Event < ActiveRecord::Base
  def self.all_future
    where("start_date_time >= ?", Time.now)
  end

  def self.all_monthly
    where("start_date_time BETWEEN ? AND ?", Time.now, Time.now + 1.month)
  end

  def self.all_weekly
    where("start_date_time BETWEEN ? AND ?", Time.now, Time.now + 1.week)
  end

  def self.all_daily
    where("start_date_time BETWEEN ? AND ?", Time.now, Time.now + 1.day)
  end
end
