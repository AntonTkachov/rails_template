class MembersController < ApplicationController
  before_action :set_member, except: [:index, :new, :create]

  def index
    @members = User.paginate(page: params[:page])
  end

  def show
  end

  def new
  end

  def create
    @member = Member.new(params[:member])

    if @member.save
      redirect_to members_path, notice: 'New member was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(params[:member])
      redirect_to members_path, notice: 'Member was successfully updated'
    else
      render :new
    end
  end

  def destroy
    @member.destroy

    redirect_to members_path, notice: 'Member was successfully removed'
  end

  private
  def set_member
    @member = User.find(params[:id])
  end
end
