class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /participants
  def index
    @participants = Participant.all
    respond_with(@participants)
  end

  # GET /participants/:id
  def show
    respond_with(@participant)
  end

  # GET /participants/new
  def new
    @participant = Participant.new
    respond_with(@participant)
  end

  # GET /participants/:id/edit
  def edit
  end

  # PATCH /participants/:id
  def update
    @participant.update(participant_params)
    respond_with(@participant)
  end

  # DELETE /participants/:id
  def destroy
    @participant.destroy
    respond_with(@participant)
  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant)
            .permit(:first_name, :last_name, :display_name, :email)
    end
end
