class Admin::GroupsController  < Admin::ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = Group.all.order("name ASC")
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to admin_groups_path, notice: 'Equipe créée.'
    else
      render action: 'new'
    end

  end

  def update
    if @group.update(group_params)
      redirect_to admin_groups_path, notice: 'Equipe modifiée.'
    else
      render action: 'edit'
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
