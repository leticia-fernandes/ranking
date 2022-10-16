class DeputiesController < ApplicationController

  def list
    @deputies = Deputy.total_expenses
  end
end
