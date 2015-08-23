require 'rails_helper'

RSpec.describe "Participants", type: :request do

  let(:participant) { create(:participant) }

  subject { response }

  describe "index (GET /participants)" do
    before {
      participant
      get '/participants'
    }
    it { should have_http_status(200) }
    it { should render_template :index }
    its(:body) { should include participant.display_name }
  end

  describe "show (GET /participants/:id)" do
    before {
      get '/participants/' + participant.to_param
    }
    it { should have_http_status(200) }
    it { should render_template :show }
    its(:body) { should include participant.display_name }
  end

  describe "new (GET /participants/:new)" do
    before {
      get '/participants/new'
    }
    it { should have_http_status(200) }
    it { should render_template :new }
  end

  describe "edit (GET /participants/:id/edit)" do
    before {
      get "/participants/#{participant.to_param}/edit"
    }
    it { should have_http_status(200) }
    it { should render_template :edit }
    its(:body) { should include participant.display_name }
  end

  describe "update (PATCH /participants/:id)" do
    let(:valid_params) do
      {
        participant: {
          display_name: 'Speedy'
        }
      }
    end
    let(:invalid_params) do
      {
        participant: {
          display_name: ''
        }
      }
    end

    describe 'with valid attributes' do
      before {
        participant
        patch participant_path(participant), valid_params
      }
      it { should redirect_to participant_path(participant) }
      it 'updates the participant' do
        expect(assigns(:participant).display_name).to eq 'Speedy'
      end
    end

    describe 'with invalid attributes' do
      before {
        participant
        patch participant_path(participant), invalid_params
      }
      it { should render_template :edit }
      it 'does not update the participant' do
        expect(participant.reload.display_name).to_not eq ''
      end
    end
  end

  describe "destroy (DELETE /participants/:id)" do
    before do
      participant
      delete participant_path(participant)
    end
    it { should redirect_to participants_path }
    it "destroys the participant" do
      expect {
        participant.reload
      }.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Participant with 'id'=1")
    end
  end
end
