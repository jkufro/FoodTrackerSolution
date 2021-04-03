# frozen_string_literal: true

require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  context 'name validation' do
    should validate_uniqueness_of(:name)
    should validate_presence_of(:name)
  end

  context 'amount validation' do
    should validate_numericality_of(:amount).is_greater_than(0)
    should allow_value(1).for(:amount)
    should allow_value(123_456_789_012).for(:amount)
    should allow_value(1.2345).for(:amount)
    should_not allow_value(0).for(:amount)
    should_not allow_value(-1).for(:amount)
    should_not allow_value(-0.0000000001).for(:amount)
  end

  context 'scopes' do
    should 'show that reverse_chronological works' do
      assert_equal [foods(:cereal), foods(:potatoes)], Food.all.reverse_chronological
    end

    should 'show that alphabetical works' do
      assert_equal [foods(:cereal), foods(:potatoes)], Food.all.alphabetical
    end
  end

  context 'methods' do
    should 'show that the summary method works' do
      assert_equal "Ate #{foods(:cereal).amount} units of #{foods(:cereal).name} (#{foods(:cereal).description})", foods(:cereal).summary
      assert_equal "Ate #{foods(:potatoes).amount} units of #{foods(:potatoes).name}", foods(:potatoes).summary
    end
  end
end
