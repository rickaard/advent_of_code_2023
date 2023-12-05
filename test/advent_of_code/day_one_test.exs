defmodule AdventOfCode.DayOneTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.DayOne

  test "sums all calibration values in the passed input for part one" do
    input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

    assert 142 = DayOne.part_one(input)
  end

  test "sums all calibration values in the passed input for part two" do
    # 29 + 83 + 13 + 24 + 42 + 14 + 76
    input_1 = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """

    # 77 + 42 + 34 + 29 + 67 + 11 + 22 + 85

    input_2 = """
    shhbgk74sevenrzknghzsk
    4sevendeight2
    bvjdfthreefive4pfxfvcxc6seven4zjkxdtcjr
    2seven4three239kmjzfhbgxxmqv
    sixfourd7
    hxkkdnjkbmftmone1npmqbnx
    rsxvqjbqx2bzprkml2
    8twothree8dzqbrvdx5
    """

    # 57 + 41 + 63 + 84 + 62 + 47 + 46 + 93 + 49 + 94
    input_3 = """
    sxvd5t7
    prkjfourhpdpxlvlnmz6onetl1
    6one3cgxhd
    nzeightwofourmz4
    lfrnfdkgsixeight2hnlzksmjrsqjmvnmk
    4jddtplseven
    four7onefivenine16
    93qd9svlnnskq8eighthree
    bxsrknfournhqmqzjxmsix5nineb
    9eightfour
    """

    # 53 + 99 + 58 + 67 + 39 + 49 + 26 + 48 + 24 + 71
    input_4 = """
    5573htvcvhkhb
    998zfcsninejnjcgnkd
    five4kdcncpsevenjftzlxmqlzxlfour8
    pkxfxvhlsix5seven
    3seveninezxz
    4sixninesgctmxxxx
    26lrlphfive4pcpdsnlntjsixtlgjrddmkx
    hp49three48rkxmzv
    rjrllvt2twotwo16four4
    seven77dccfgqbf1
    """

    # 51 + 11 + 47 + 22
    input_5 = """
    five11eight1
    1twoonepzrjzsdfourdbdrxg1
    43347two7
    2eightsevenonenine2
    """

    # 55 + 33 + 82 + 58 + 33
    input_6 = """
    five
    threefivethree
    eightwo
    fiveeight3sppjtccnineeighteightnffgtlsdj
    threethreetwothree
    """

    # 83 + 79 + 21 + 82 + 98 + 98 + 88 + 11 + 78 + 74
    input_7 = """
    eighthree
    sevenine
    twone
    eightwo
    nineight
    nineeight
    eeeight
    oooneeone
    sevenjxbbplfour488trzv
    rcnvxqrsevenjttxd9fiverqzblpnrcjhbc4
    """

    assert 281 = DayOne.part_two(input_1)
    assert 367 = DayOne.part_two(input_2)
    assert 636 = DayOne.part_two(input_3)
    assert 534 = DayOne.part_two(input_4)
    assert 131 = DayOne.part_two(input_5)
    assert 261 = DayOne.part_two(input_6)
    assert 712 = DayOne.part_two(input_7)
    assert 16 = DayOne.part_two("one1165bjcpkpsjfxlnmz6")
  end
end
