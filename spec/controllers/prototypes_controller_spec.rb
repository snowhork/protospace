require 'rails_helper'

RSpec.describe PrototypesController, :type => :controller do
  describe 'with user login' do
    let(:user) { create(:user) }
    let(:login) { sign_in user }
    describe 'GET #index' do
      let(:request) { get :index }
      let(:prototypes) { create_list(:prototype, 3) }
      it 'assigns the requested prototypes to @prototypes' do
        login
        request
        expect(assigns(:prototypes)).to match(prototypes.sort_by { |prototype| prototype.created_at}.reverse)
      end

      it 'renders the :index template' do
        login
        request
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      let(:request) { get :new }
      it 'renders the :new template' do
        login
        request
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      let(:request) { post :create, params }
      describe 'with valid attributes' do
        let(:params) { { prototype: { title: 'TAITORU', catch_copy: 'KOPII', concept: 'KONSEPUTO' , images_attributes: {}, tag_list: {} } } }
        it 'saves the new prototype in the database' do
          login
          request
          expect(assigns(:prototype)).to be_persisted
        end

        it 'redirects to root_path' do
          login
          request
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype succesfully' do
          login
          request
          expect(flash[:success]).to include('Upload your prototype successfully')
        end
      end

      describe 'with invalid attributes' do
        let(:params) { { prototype: { title: nil, catch_copy: 'KOPII', concept: 'KONSEPUTO' , images_attributes: {}, tag_list: {} } } }
        it 'does not save the new prototype in the database' do
          login
          request
          expect(assigns(:prototype)).not_to be_persisted
        end
        it 'redirects new_prototype_path' do
          login
          request
          expect(response).to render_template :new
        end
        it 'shows flash messages to show save the prototype unsuccessfully' do
          login
          request
          expect(flash[:danger]).to include("Title can't be blank")
        end
      end

      describe 'GET #show' do
        let(:request) { get :show, id: prototype.id }
        it 'assigns the requested prototype to @prototype' do
          prototype = create(:prototype)
          get :show, id: prototype.id
          expect(assigns(:prototype)).to eq prototype
        end

        it 'assigns the requested comment to @comment' do
          prototype = create(:prototype, :with_comments)
          get :show, id: prototype.id
          expect(assigns(:prototype).comments).to match(prototype.comments)
        end

        it 'assigns likes associated with prorotype to @likes' do
          prototype = create(:prototype, :with_likes)
          get :show, id: prototype.id
          expect(assigns(:prototype).likes).to match(prototype.likes)
        end

        it 'renders the :show template' do
          prototype = create(:prototype)
          get :show, id: prototype.id
          expect(response).to render_template :show
        end
      end

      describe 'GET #edit' do
        let(:prototype) { create(:prototype, user: user) }
        let(:request) { get :edit, id: prototype.id }
        it 'assigns the requested prototype to @prototype' do
          login
          request
          expect(assigns(:prototype)).to eq prototype
        end

        it 'renders the :edit template' do
          login
          request
          expect(response).to render_template :edit
        end
      end

      describe 'PATCH #update' do
        let(:prototype) { create(:prototype, user: user) }
        let(:request) { patch :update, params }
        before :each do
          login
          request
        end
        describe 'with valid attributes' do
          let(:params) { { prototype: { title: 'edited_title', tag_list: {} }, id: prototype.id } }
          it 'assigns the requested prorotype to @prototype' do
            expect(assigns(:prototype)).to eq prototype
          end

          it 'assigns the requested comment to @comment' do
            expect(assigns(:prototype).comments).to match prototype.comments
          end

          it 'updates attribtues of prototype' do
            expect(assigns(:prototype).title).to eq params[:prototype][:title]
          end

          it 'redirects to root_path' do
            expect(response).to redirect_to root_path
          end

          it 'shows flash message to show update prototype successfully' do
            expect(flash[:success]).to include 'Edit your prototype successfully'
          end
        end

        describe 'with invalid attributes' do
          let(:params) { { prototype: { title: nil, tag_list: {} }, id: prototype.id } }
          it 'assigns the requested prototype to @prototype' do
            expect(assigns(:prototype)).to eq prototype
          end

          it 'does not save the new prototype' do
            expect(prototype.title).to eq 'TAITORU'
          end

          it 'renders the :edit template' do
            expect(response).to render_template :edit
          end

          it 'shows flash message to show update prototype unsuccessfully' do
            expect(flash[:danger]).to include "Title can't be blank"
          end
        end
      end

      describe 'DELETE #destroy' do
        let!(:prototype) { create(:prototype, user: user) }
        let(:request) { delete :destroy, params }
        let(:params) { { id: prototype.id } }
        before :each do
          login
        end
        it 'assigns the requested prototype to @prototype' do
          request
          expect(assigns(:prototype)).to eq prototype
        end

        it 'deletes the prototype' do
          expect { request }.to change(Prototype, :count).by(-1)
        end

        it 'redirects to root_path' do
          request
          expect(response).to redirect_to root_path
        end

        it 'shows flash message to show delete prototype successully' do
          request
          expect(flash[:success]).to include "Delete your prototype successfully"
        end
      end
    end

    describe 'without user login' do
      describe 'GET #new' do
        let(:request) { get :new }
        it 'redirects sign_in page' do
          request
          expect(response).to redirect_to new_user_session_path
        end
      end
      describe 'POST #create' do
        let(:request) { post :create }
        it 'redirects sign_in page' do
          request
          expect(response).to redirect_to new_user_session_path
        end
      end
      describe 'GET #edit' do
        let(:prototype) { create(:prototype) }
        let(:request) { get :edit , id: prototype.id }
        it 'redirects sign_in page' do
          request
          expect(response).to redirect_to new_user_session_path
        end
      end
      describe 'PATCH #update' do
        let(:prototype) { create(:prototype) }
        let(:request) { patch :update, id: prototype.id }
        it 'redirects sign_in page' do
          request
          expect(response).to redirect_to new_user_session_path
        end
      end
      describe 'DELETE #destroy' do
        let(:prototype) { create(:prototype) }
        let(:request) { delete :destroy, id: prototype.id }
        it 'redirects sign_in page' do
          request
          expect(response).to redirect_to new_user_session_path
        end
      end
    end
  end
end
