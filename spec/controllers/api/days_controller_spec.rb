require 'rails_helper'

describe Api::DaysController, type: :request do
  describe 'GET #index' do
    let(:user) { create :user }
    let(:day1) { create :day, user: user }
    let(:day2) { create :day, user: user }
    let!(:word1) { create :word, day: day1 }
    let!(:word2) { create :word, day: day2 }

    subject do
      get '/api/days', headers: authenticated_header(user)
    end

    it 'return all days with assosiated words for authenticated user' do
      subject

    end
  end

end
