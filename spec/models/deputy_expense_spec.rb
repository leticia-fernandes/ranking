require 'rails_helper'

RSpec.describe DeputyExpense, type: :model do

  describe 'validations' do
    let(:deputy) { Deputy.create(registration: '123') }
    subject { DeputyExpense.create(deputy_registration: deputy.registration) }

    it { should validate_presence_of(:deputy_registration) }
    it { should belong_to(:deputy) }
  end
end
