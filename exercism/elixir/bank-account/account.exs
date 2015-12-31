defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  #require Record
  #Record.defrecord :user name: "john", age: 25
  #@type user :: record(:user, name: String.t, age: integer)

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    spawn(fn -> process(0) end)
  end

  defp process(balance) do
    receive do
      {:balance, bank} ->
        send(bank, balance)
        process(balance)
      {:update, amount} -> process(balance + amount)
      :close -> nil
      _ -> process(balance)
    end
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    send(account, :close)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    send(account, {:balance, self()})
    receive do
      x -> x
    end
  end
 
  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    send(account, {:update, amount})
  end
end
