describe MembersController do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe '#new' do
    it 'require admin privilegios' do
      get :new

      expect(request).to redirect_to(root_path)
    end
  end

  describe '#create' do
    it 'require admin privilegios' do
      post :create

      expect(request).to redirect_to(root_path)
    end
  end

  describe '#edit' do
    it 'require admin privilegios' do
      get :edit, params: { id: user.id }

      expect(request).to redirect_to(root_path)
    end
  end

  describe '#update' do
    it 'require admin privilegios' do
      put :update, params: { id: user.id }

      expect(request).to redirect_to(root_path)
    end
  end

  describe '#destroy' do
    it 'require admin privilegios' do
      delete :destroy, params: { id: user.id }

      expect(request).to redirect_to(root_path)
    end
  end
end
