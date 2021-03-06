# frozen_string_literal: true

describe 'Profiles API' do
  let(:headers) do
    {
      "CONTENT_TYPE" => "application/json",
      "ACCEPT" => "application/json"
    }
  end

  describe 'GET /api/v1/profiles/me' do
    context 'unauthorized' do
      it 'returns 401 status and empty body if there is no access_token' do
        send :get, '/api/v1/profiles/me', headers: headers

        expect(response.body).to be_empty
        expect(response.status).to eq 401
      end
  
      it 'returns 401 status and empty body if access_token is invalid' do
        send :get, '/api/v1/profiles/me', params: { access_token: '1234' }, headers: headers

        expect(response.body).to be_empty
        expect(response.status).to eq 401
      end
    end

    context 'authorized' do
      let(:me) { create(:user) }
      let(:access_token) { create(:access_token, resource_owner_id: me.id) }
      let(:object) { me }
      let(:public_fields) { %w[ id email admin created_at updated_at ] }
      let(:response_object) { JSON.parse(response.body)['user'] }

      before { get '/api/v1/profiles/me', params: { access_token: access_token.token }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns all public fields' do
        public_fields.each do |attr|
          expect(JSON.parse(response.body)['user'][attr]).to eq object.send(attr).as_json
        end
      end

      it 'does not return private fields' do
        %w[ password encrypted_password ].each do |attr|
        expect(JSON.parse(response.body)).to_not have_key(attr)
        end
      end
    end
  end
end
