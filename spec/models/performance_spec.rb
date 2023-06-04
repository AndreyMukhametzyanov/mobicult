# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Performance do
  describe 'associations' do
    it { is_expected.to have_many(:player_performances) }
    it { is_expected.to have_many(:matches) }
    it { is_expected.to have_many(:players) }
  end
end
