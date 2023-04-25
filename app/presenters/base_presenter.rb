# frozen_string_literal: true

class BasePresenter
  delegate :to_model, :id, to: :@obj

  def initialize(obj)
    @obj = obj
  end

  def self.present(items)
    items.collect { |item| new item }
  end
end
