defmodule WorkdayReportsTest do
  use ExUnit.Case

  @test_file "workday_test.csv"

  describe "call/1" do
    test "return a report of hours worked per user, segregated by general, month and year " do
      sut =
        @test_file
        |> WorkdayReports.call()

      assert %{all_hours: all, hours_per_month: per_month, hours_per_year: per_year} = sut
      assert all["Cleiton"] == 12
      assert per_month["Cleiton"]["junho"] == 4
      assert per_year["Cleiton"][2020] == 9
    end
  end
end
