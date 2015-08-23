require 'rails_helper'

RSpec.describe "Pages", type: :request do
  subject { response }
  describe "Home (/)" do
    before { get '/' }
    it { should have_http_status(:ok) }
  end
end
