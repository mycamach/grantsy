class CalendarController < ApplicationController

  def index
    @funds = Fund.all
  end
end
