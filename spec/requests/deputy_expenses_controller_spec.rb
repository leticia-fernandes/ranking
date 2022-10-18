require 'rails_helper'

RSpec.describe DeputyExpensesController, type: :request do

  describe "list" do
    let!(:deputy) { Deputy.create(name: 'Deputado', registration: '123', party: 'Partido', uf: 'CE') }
    let!(:expense) { deputy.expenses.create(value: 100) }

    before { get "/deputies/#{deputy.registration}/expenses" }

    it { expect(assigns(:deputy)).to eq(deputy) }
    it { expect(assigns(:expenses)).to match_array(expense) }
  end
end
