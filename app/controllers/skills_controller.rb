class SkillsController < ApplicationController
  # setting fighter_id to maintain it as param
  before_action :set_fighter_id
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all

  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @fighter_id=params[:fighter_id]
  end

  # GET /skills/new
  def new
    @skill = Skill.new
    @permision_id = params[:id]
    @fighter_id=params[:fighter_id]
  end

  # GET /skills/1/edit
  def edit
    @fighter_id=params[:fighter_id]
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Fighter has successfully learned new skill.' }
        format.json { render :show, status: :created, location: @skill }
      else
        # had to change render to redirec_to to be able to maintain params for fighter_id within hidden_field
        format.html { redirect_to new_skill_path(:fighter_id => @skill.fighter_id), notice: @skill.errors}
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { redirect_to edit_skill_path(:fighter_id => @skill.fighter_id), notice: @skill.errors }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end
    def set_fighter_id
      @fighter_id = params[:fighter_id]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:fighter_id, :skill_type, :level)
    end
end
