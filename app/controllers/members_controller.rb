class MembersController < ApplicationController
  before_action :set_member, except: [:index, :new, :create]

  def index
    @members = User.paginate(page: params[:page])
  end

  def show
  end

  def new
    @member = User.new
  end

  def create
    @member = User.new(member_params)

    if @member.save
      redirect_to members_path, notice: 'New member was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
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

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :birth_date,
                                   :gender, :role_id, :active)
  end
end
