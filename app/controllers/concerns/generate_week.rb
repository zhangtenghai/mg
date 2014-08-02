module GenerateWeek
  extend ActiveSupport::Concern

  def generate_week(day,page = 0)
    day = "'#{day}'.to_date"
    page = page.to_i
    if page != 0 
      select = page > 0 ? "next" : "prev"
      last = page.abs
      (1..last).each { day = day + ".#{select}_week" }
    end
    week_begin = eval(day)
    return (week_begin.beginning_of_week..week_begin.end_of_week).to_a
  end
end