module ApplicationHelper
  def get_year_month_ranges
      months_range = [
        ['Enero', 1],
        ['Febrero', 2],
        ['Marzo', 3],
        ['Abril', 4],
        ['Mayo', 5],
        ['Junio', 6],
        ['Julio', 7],
        ['Agosto', 8],
        ['Septiembre', 9],
        ['Octubre', 10],
        ['Noviembre', 11],
        ['Diciembre', 12]
      ]

      years_range = []
      for year in (Time.new.year - 10)..Time.new.year
        years_range << [year, year]
      end

      return { months: months_range, years: years_range }
  end
end
