# frozen_string_literal: true

# Retrieve throw item from curb or generate via random
class ThrowItemService
  def self.throw
    new.throw
  end

  def throw
    item_by_curb = CurbResponseService.throw_item

    throw_item = if valid?(item_by_curb)
                   JSON.parse(item_by_curb['body'])
                 else
                   ThrowItemFactory::KNOWN_ITEMS.keys.sample
                 end
    ThrowItemFactory.get_by_type(throw_item)
  end

  private

  def available_types
    ThrowItemFactory::KNOWN_ITEMS.keys
  end

  def valid?(comp_pick)
    return false if comp_pick.blank? || comp_pick['statusCode'] != 200

    value = JSON.parse(comp_pick['body'])
    available_types.include?(value)
  end
end
