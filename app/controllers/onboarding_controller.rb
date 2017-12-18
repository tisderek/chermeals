class OnboardingController < ApplicationController
  before_action :authenticate_member!
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @member = current_member
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.provider = @member
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


end
