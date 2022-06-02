defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list." do
      expected_response = {:ok, [1, 2, :fizz, 4, 5, 10, :fizzbuzz, 20]}
      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when a invalid file is provided, returns the converted list." do
      expected_response = {:error, "Error while reading the file, reason: enoent"}
      assert FizzBuzz.build("invalid.txt") == expected_response
    end
  end
end
