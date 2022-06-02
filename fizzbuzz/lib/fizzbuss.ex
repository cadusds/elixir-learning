defmodule Fizzbuss do
  # build function implements by diferents ways

  def build(file_name) do
    case File.read(file_name) do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end

  def build2(file_name) do
    file = File.read(file_name)
    handle_file_read(file)
  end

  def build3(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def build4(file_name) do
    file_name
    |> File.read()
    |> handle_file_read2()
  end

  def build5(file_name) do
    file_name
    |> File.read()
    |> handle_file_read3()
  end

  # handle_file_read function implements by diferents ways

  defp handle_file_read({:ok, result}), do: result
  defp handle_file_read({:error, reason}), do: "Error reading the file: #{reason}"

  defp handle_file_read2({:ok, result}) do
    list = String.split(result, ",")
    Enum.map(list, &String.to_integer/1)
  end

  defp handle_file_read2({:error, reason}), do: "Error reading the file: #{reason}"

  defp handle_file_read3({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read3({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuss
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buss
  defp evaluate_numbers(number), do: number
end
