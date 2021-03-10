defmodule WorkdayReports.ParserTeste do
  use ExUnit.Case
  alias WorkdayReports.Parser

  @test_file "reports/workday_test.csv"

  describe "parser_csv/1" do
    test "should return parsed file" do
      sut =
        @test_file
        |> Parser.parser_csv()
        |> Enum.map(& &1)
        |> Enum.take(3)

      expected = [
        ["Daniele", 7, 29, 4, 2018],
        ["Mayk", 4, 9, 12, 2019],
        ["Daniele", 5, 27, 12, 2016]
      ]

      assert sut == expected
    end
  end
end
