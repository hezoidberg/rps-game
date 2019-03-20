# frozen_string_literal: true

require 'test_helper'

# Test comparsion of throw items(rock, paper, scissors)
class ComparasionTest < ActiveSupport::TestCase
  setup do
    @rock = ThrowItemFactory.get_by_type('rock')
    @paper = ThrowItemFactory.get_by_type('paper')
    @scissors = ThrowItemFactory.get_by_type('scissors')
  end

  test 'rock beats scissors' do
    assert(@rock > @scissors)
  end

  test 'rock loses paper' do
    assert(@rock < @paper)
  end

  test 'scissors beats paper' do
    assert(@scissors > @paper)
  end

  test 'tie' do
    paper = ThrowItemFactory.get_by_type('paper')
    assert(@paper == paper)
  end
end
