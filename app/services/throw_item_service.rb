# frozen_string_literal: true

# Retrieve throw item from curb or generate via random
class ThrowItemService
  def self.throw
    new.throw
  end

  def throw
    item_by_curb = CurbResponseService.throw_item

    throw_item = if item_by_curb.nil? || item_by_curb['statusCode'] != 200
                   ThrowItemFactory::KNOWN_ITEMS.keys.sample
                 else
                   p item_by_curb['body']
                   item_by_curb['body']
                 end
    ThrowItemFactory.get_by_type(throw_item)
  end
end
