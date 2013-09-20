require 'spec_helper'

describe Event do
  it 'returns the future events' do
    Time.stub(:now).and_return(Time.new(2013, 10, 10))
    event = Event.new(:start_date_time => "2013-10-10 11:00:00")
    event.save
    Event.all_future.should eq [event]
  end

  it 'returns the current monthly events' do
    Time.stub(:now).and_return(Time.new(2013, 10, 10))
    event = Event.new(:start_date_time => "2013-10-10 11:00:00")
    event.save
    Event.all_monthly.should eq [event]
  end

  it 'returns the current weekly events' do
    Time.stub(:now).and_return(Time.new(2013, 10, 10))
    event = Event.new(:start_date_time => "2013-10-10 11:00:00")
    event.save
    Event.all_weekly.should eq [event]
  end

  it 'returns the current daily events' do
    Time.stub(:now).and_return(Time.new(2013, 10, 10))
    event = Event.new(:start_date_time => "2013-10-10 11:00:00")
    event.save
    Event.all_daily.should eq [event]
  end
end
