class VotesController < ApplicationController
  before_filter :verify, only: [:new, :create]

  # GET /votes/new
  # GET /votes/new.json
  def new
    @type = params[:type]
    @position = Position.where position_type: @type
    @candidates = []
    @position.each do |position|
      if @type == "class"
        @candidates.push position.candidates.find_by_grade(current_user.grade)
      else
        @candidates.push position.candidates
      end
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @type= params[:type]
    @student= current_user
    @position = Position.where(position_type: @type)
    @position.each do |pos|
      if !params[pos.name].nil?
        @candidate = Candidate.find_by_name(params[pos.name])
        @vote = current_user.votes.build(position_id: pos.id, candidate_id: @candidate.id) 
        redirect_to(root_path) and flash[:error] = "Something went wrong and your vote was not created!" unless @vote.save
      end
    end
    change_type
    sign_in @student
    redirect_to root_path
    flash[:notice]= "Your vote has been created! Thanks for voting!"
  end

  def change_type
    if params[:type] == "asb"
      current_user.update_attribute(:asb_vote, true)
    elsif params[:type] == "class"
      current_user.update_attribute(:class_vote, true)
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end



  private

    def verify
      if params[:type] == "asb"
        redirect_to(root_path) unless asb?
      elsif params[:type] == "class"
        redirect_to(root_path) unless class?
      end
    end


end
