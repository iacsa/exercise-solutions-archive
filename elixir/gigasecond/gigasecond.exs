defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from(:calender.datetime) :: :calendar.datetime

	def from(datetime) do
    datetime
      |> :calendar.datetime_to_gregorian_seconds
      |> (&(&1 + 1_000_000_000)).()
      |> :calendar.gregorian_seconds_to_datetime
	end
end
