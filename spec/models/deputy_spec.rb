require 'rails_helper'

RSpec.describe Deputy, type: :model do

  describe 'validations' do
    subject { Deputy.create(registration: '123') }

    it { should validate_uniqueness_of(:registration) }
    it { should validate_presence_of(:registration) }
    it { should have_many(:expenses) }
  end
end
