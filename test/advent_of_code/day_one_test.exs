defmodule AdventOfCode.DayOneTest do
  use ExUnit.Case

  alias AdventOfCode.DayOne

  test "sums all calibration values for the passed input" do
    input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

    assert 142 = DayOne.summed_calibration_values(input)
  end
end
