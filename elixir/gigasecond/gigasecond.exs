defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from({year, month, day}) do
    :calendar.gregorian_days_to_date(trunc(
      :calendar.date_to_gregorian_days({year, month, day}) +
        (1000000000 / (60 * 60 * 24))))
	end
end
