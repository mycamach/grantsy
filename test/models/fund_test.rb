require 'test_helper'

class FundTest < ActiveSupport::TestCase
  test "should not save fund without institution" do
    fund = Fund.new
    assert_not fund.save, "Saved fund without institution"
  end

  test "should not save fund without name" do
    fund = Fund.new
    assert_not fund.save, "Saved fund without name"
  end

  test "should not save fund without description" do
    fund = Fund.new
    assert_not fund.save, "Saved fund without description"
  end

  test "should not save fund without amount" do
    fund = Fund.new
    assert_not fund.save, "Saved fund without amount"
  end

  test "should not save fund without start and end dates" do
  fund = Fund.new
  assert_not fund.save, "Saved fund without dates"
  end

  test "should not save fund without url" do
    fund = Fund.new
    assert_not fund.save, "Saved fund without url"
  end

  test "should save fund" do
    fund = funds(:one)
    assert fund.save
  end

  test "title returns name" do
    fund = funds(:one)
    assert_equal fund.title, fund.name, "Title is not equal to name"

  test "should not save fund without date" do
   fund = Fund.new
   assert_not fund.save
  end
end
