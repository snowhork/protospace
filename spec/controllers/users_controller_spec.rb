require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'with user login' do
    let(:user) { create(:user) }
    let(:login) { sign_in user }
    describe 'GET #show' do
      let(:request) { get :show, id: user}
      it 'assigns the requested to @user' do
        request
        expect(assigns(:user)).to eq user
      end

      it 'renders the :show templates' do
        request
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      let(:request) { get :edit, id: user}
      it 'assigns the requested to @user' do
        login
        request
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit templates' do
        login
        request
        expect(assigns(:user)).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      let(:request) { patch :update, params}
      let(:params) { { user: { works: 'changed_works', password: '12345678' }, id: user.id } }
      it "don't occur error" do
        login
        request
        expect(user.errors).to be_empty
      end

      it "redirects root path" do
        login
        request
        expect(response).to redirect_to root_path
      end

      it "sends flash message" do
        login
        request
        expect(flash[:success]).not_to be_empty
      end
    end
  end

  describe 'without user login' do
    let(:user) { create(:user) }
    describe 'GET #edit' do
      let(:request) { get :edit, id: user.id }
      it 'redirects to root' do
        request
        expect(response).to redirect_to root_path
      end
    end

    describe 'PATCH #update' do
      let(:request) { patch :update, id: user.id }
      it 'redirects to root' do
        request
        expect(response).to redirect_to root_path
      end
    end
  end
end
