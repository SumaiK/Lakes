class HolidayInvitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @holiday_invites = policy_scope(HolidayInvite)
  end

  def new
    @holiday_invite = HolidayInvite.new
    @holiday = Holiday.find(params[:id])
    authorize @holiday_invite
  end

  def create
    @holiday = Holiday.find(params[:project_id])
    @project_invite.update(user: current_user, holiday: @holiday, status: "pending")
    if @holiday_invite.save
      redirect_to holidays_path(@holiday)
    else
      render :new
    end

    puts @holiday.users
    puts @holiday_invite.user
    authorize @holiday_invite
  end

  def edit
    @holiday_invite = HolidayInvite.find(params[:id])
    authorize @holiday_invite
  end

  def update
    @holiday_invite = HolidayInvite.find(params[:id])
    # @holiday_invite.update(holiday_inv_params)
    if @holiday_invite.save
      redirect_to holidays_path(@holiday_invite.holiday)
    else
      render :new
    end
    authorize @holiday_invite
  end

  def destroy
    @holiday_invite = HolidayInvite.find(params[:id])
    @holiday_invite.destroy
    redirect_to holidays_path(@holiday_invite.holiday)
    authorize @holiday_invite
  end

  def status_accept
    @holiday_invite = HolidayInvite.find(params[:id])
    @holiday_invite.status = "accepted"
    @holiday = @holiday_invite.holiday
    @user = @holiday_invite.user
    if @holiday_invite.save
      redirect_to holidays_path(@holiday_invite.holiday)
    else
      render :new
    end
    authorize @holiday_invite
  end

  def status_reject
    @holiday_invite = HolidayInvite.find(params[:id])
    @holiday_invite.status = "rejected"
    @holiday_invite.save
    redirect_to holidays_path(@holiday_invite.holiday)
    authorize @holiday_invite
  end
end
