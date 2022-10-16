class DeputyExpensesController < ApplicationController

  def list
    @deputy = Deputy.find_by(registration: params[:deputy_id])
    @expenses = @deputy.expenses.desc
  end
end
