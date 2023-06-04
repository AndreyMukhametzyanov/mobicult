# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayerPerformance do
  describe 'associations' do
    it { is_expected.to belong_to(:match) }
    it { is_expected.to belong_to(:performance) }
    it { is_expected.to belong_to(:player) }
  end
end
