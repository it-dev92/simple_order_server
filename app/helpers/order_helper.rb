# frozen_string_literal: true

module OrderHelper
  def status_data(state)
    case state
    when 'pending'
      [['Move To Progress', 'progress']]
    when 'progress'
      [['Move To Complete', 'complete']]
    else
      []
    end
  end
end
