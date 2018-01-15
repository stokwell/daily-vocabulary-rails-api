require 'rails_helper'

describe Api::WordsController, type: :request do
  describe 'POST #create' do

    let(:user){ create :user }

    subject do
      post '/api/words', params: { word: { original: 'asd', translation: 'sda', transcription: 'ww', from: 'EN', to: 'RU' } }, headers: authenticated_header(user)
    end

    specify do
      expect(subject).to eq 204
    end

    it 'should create new translation record' do
      subject
      expect(Word.first).to have_attributes(
        {
          original: 'asd',
          translation: 'sda',
          transcription: 'ww',
          from: 'EN',
          to: 'RU'
        }
      )
    end
  end

end
