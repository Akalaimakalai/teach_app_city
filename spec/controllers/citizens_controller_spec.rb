# frozen_string_literal: true

RSpec.describe CitizensController do
  describe 'GET #index' do
    let!(:citizen_1) { create(:citizen) }
    let!(:citizen_2) { create(:citizen) }
    let!(:citizen_3) { create(:citizen, :dead) }

    before { get :index }

    it 'returns an array of alive citizens' do
      expect(assigns(:citizens)).to contain_exactly(citizen_1, citizen_2)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new citizen to @citizen' do
      expect(assigns(:citizen)).to be_a_new(Citizen)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:citizen) { build(:citizen) }
    let(:params) { { 'citizen' => citizen.attributes } }

    describe 'Valid' do
      it 'creates a new citizen' do
        expect { post :create, params: params }.to change(Citizen, :count).by(1)
      end
    end

    describe 'Invalid' do
      before { citizen.gender = 'KA-52' }

      it 'does not create a new citizen' do
        expect { post :create, params: params }.to_not change(Citizen, :count)
      end
    end

    it 'redirect to root' do
      post :create, params: params
      expect(response).to redirect_to :root
    end
  end

  describe 'GET #edit' do
    let(:citizen) { create(:citizen) }

    before { get :edit, params: { id: citizen } }

    it 'assigns the requested citizen to @citizen' do
      expect(assigns(:citizen)).to eq citizen
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let(:citizen) { create(:citizen) }
    let(:params) do
      {
        id: citizen,
        citizen: citizen.attributes.merge(state: 'dead')
      }
    end

    describe 'Valid' do
      it "changes the citizen's attribetes" do
        expect { put :update, params: params }.to change { Citizen.find(citizen.id).state }.from('alive').to('dead')
      end
    end

    describe 'Invalid' do
      let(:params) do
        {
          id: citizen,
          citizen: citizen.attributes.merge(age: -5)
        }
      end

      it "does not change the citizen's attribetes" do
        expect { put :update, params: params }.to_not(change { Citizen.find(citizen.id).age })
      end
    end

    it 'redirect to root' do
      patch :update, params: params
      expect(response).to redirect_to :root
    end
  end

  describe 'DELETE #destroy' do
    let!(:citizen) { create(:citizen) }
    let(:params) { { id: citizen.id } }

    describe 'Valid' do
      it 'deletes the citizen' do
        expect { delete :destroy, params: params }.to change(Citizen, :count).by(-1)
      end
    end

    describe 'Invalid' do
      let(:params) { { id: citizen.id + 8 } }

      it 'does not delete the citizen' do
        expect { delete :destroy, params: params }.to_not change(Citizen, :count)
      end
    end

    it 'redirect to root' do
      delete :destroy, params: params
      expect(response).to redirect_to :root
    end
  end
end
