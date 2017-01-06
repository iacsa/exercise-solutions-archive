defmodule Markdown do

  @spec parse(String.t) :: String.t
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.map_join(&process/1)
    |> encapsulate_lists
  end

  @spec process(String.t) :: String.t
  defp process(line) do
    cond do
      String.starts_with?(line, "#") ->
        process_header(line)
      String.starts_with?(line, "*") ->
        process_list(line)
      true ->
        process_paragraph(line)
    end
  end

  @spec process_header(String.t) :: String.t
  defp process_header(header) do
    [marker , text] = String.split(header, "\s", parts: 2)
    enclose_in(text, "h#{String.length(marker)}")
  end

  @spec process_list(String.t) :: String.t
  defp process_list(line) do
    line
    |> String.trim_leading("* ")
    |> emphasize_words
    |> enclose_in("li")
  end

  @spec process_paragraph(String.t) :: String.t
  defp process_paragraph(line) do
    line
    |> emphasize_words
    |> enclose_in("p")
  end

  @spec enclose_in(String.t, String.t) :: String.t
  defp enclose_in(text, tag) do
    "<#{tag}>#{text}</#{tag}>"
  end

  @spec emphasize_words(String.t) :: String.t
  defp emphasize_words(line) do
    line
    |> String.split
    |> Enum.map_join(" ", &process_word/1)
  end

  @spec process_word(String.t) :: String.t
  defp process_word(word) do
    word
    |> tag_strong
    |> tag_em
  end

  @spec tag_strong(String.t) :: String.t
  defp tag_strong(word) do
    word
    |> String.replace_suffix("__", "</strong>")
    |> String.replace_prefix("__", "<strong>")
  end

  @spec tag_em(String.t) :: String.t
  defp tag_em(word) do
    word
    |> String.replace_prefix("_", "<em>")
    |> String.replace_suffix("_", "</em>")
  end

  @spec encapsulate_lists(String.t) :: String.t
  defp encapsulate_lists(l) do
    String.replace(l, ~r/<li>(.*)<\/li>/, "<ul><li>\\1</li></ul>")
  end

end
