require 'rails_helper'

RSpec.describe DeputiesController, type: :request do

  describe "list" do
    it "returns a list of deputies" do
      deputy = Deputy.create(name: 'Deputado', registration: '123', party: 'Partido', uf: 'CE')

      get '/'
      expect(assigns(:deputies)).to match_array(deputy)
    end
  end
end
