class StatisticsController < ApplicationController
  before_action :set_statistic, only: [:show, :edit, :update, :destroy]
  
  def choose_opponent
      # nothing to do here
  end
  # calculating fight results 
  def fight_results
    # choosing as more likely attacker the one who has more experience
    if Statistic.find_by("fighter_id=#{params[:id1]}").experience >= Statistic.find_by("fighter_id=#{params[:id2]}").experience
      @first_fighter=FighterDatum.new(params[:id1])
      @second_fighter=FighterDatum.new(params[:id2])
    else
      @first_fighter=FighterDatum.new(params[:id2])
      @second_fighter=FighterDatum.new(params[:id1])
    end
    # array with string comments about fight details
    @fight_results_arr=[{}]
    # experienc earned by the winner
    @exp_earned=0
    handle_fights
  end

  # main method to calculate fights
  # fighter with more experience has 75% chance to be first to attack
  def handle_fights
    @turn_iterattor=0
    while @first_fighter.health*@second_fighter.health>0
      @turn_iterattor+=1
      @fight_results_arr.push(space:"")
      @fight_results_arr.push(newTurn:"Turn number #{@turn_iterattor} begins")
      @fight_results_arr.push(currHealth:"#{@first_fighter.name} has #{@first_fighter.health} health points.")
      @fight_results_arr.push(currHealth:"#{@second_fighter.name} has #{@second_fighter.health} health points.")
      @fight_results_arr.push(space:"")

      # randmoize the one who may strike in this turn
      # Fighter with more experience has 75% chance to strike
      which_one=rand(0..100)
      if which_one<75
        @fight_results_arr.push(attacker:"#{@first_fighter.name} attacks #{@second_fighter.name}")
        fight_turn(@first_fighter,@second_fighter)
      else
        @fight_results_arr.push(attacker:"#{@second_fighter.name} attacks #{@first_fighter.name}")
        fight_turn(@second_fighter,@first_fighter)
      end
      # check if fighters are still alive and can regenerate
      check_regeneration(@first_fighter) if @first_fighter.health>0
      check_regeneration(@second_fighter) if @second_fighter.health>0
    end
    @fight_results_arr.push(space:"")

    # Check which one of the fighters has died, and which one has won
    if @second_fighter.health<=0 then
      @winner=1
      @second_fighter.skills_arr.each do |skill|
        @exp_earned+=skill.level
      end
      @fight_results_arr.push(defeated:"#{@first_fighter.name} has defeated #{@second_fighter.name}.")
      # Update databases
      Statistic.find_by(:fighter_id => @first_fighter).increment!(:experience, by = @exp_earned) # update(:experience => :experience+@exp_earned, :win => )
      Statistic.find_by(:fighter_id => @first_fighter).increment!(:win, by = 1)
      Statistic.find_by(:fighter_id => @second_fighter).increment!(:lost, by = 1)
    else
      @winner=2
      @first_fighter.skills_arr.each do |skill|
        @exp_earned+=skill.level
      end
      @fight_results_arr.push(defeated:"#{@second_fighter.name} has defeated #{@first_fighter.name}.")
      # Update databases
      Statistic.find_by(:fighter_id => @second_fighter).increment!(:experience, by = @exp_earned) # update(:experience => :experience+@exp_earned, :win => )
      Statistic.find_by(:fighter_id => @second_fighter).increment!(:win, by = 1)
      Statistic.find_by(:fighter_id => @first_fighter).increment!(:lost, by = 1)
    end
  end

  # each fighting turn -> one strike
  def fight_turn(attacker,deffender)
    # calculating damage to be dealt
    deffender_defence=deffender.defence-attacker.defence_penetration
    critical_strike_chance=attacker.get_critical_strikes_level_if_has_one*5
    has_criticaly_striked=rand(1..100)
    has_criticaly_striked_boolean=false
    if has_criticaly_striked<critical_strike_chance
      damage_dealt_to_defender=attacker.damage*2-deffender_defence
      has_criticaly_striked_boolean=true
    else
      damage_dealt_to_defender=attacker.damage-deffender_defence
    end
    damage_dealt_to_defender=1 if damage_dealt_to_defender<0 

    # checking if deffender can dodge
    deffender_dodge_level=deffender.get_dodging_level_if_has_one
    dodge_chance=deffender_dodge_level*5;
    has_dodged=rand(0..100)
    if (has_dodged<=dodge_chance) then
      @fight_results_arr.push(avoided:"#{deffender.name} has successfully avoided damage")
    elsif has_criticaly_striked_boolean
      deffender.health-=damage_dealt_to_defender  
      @fight_results_arr.push(damageDealt:"#{attacker.name} has crtically striked #{deffender.name} dealing #{damage_dealt_to_defender}")
    else
      deffender.health-=damage_dealt_to_defender  
      @fight_results_arr.push(damageDealt:"#{attacker.name} has dealt #{damage_dealt_to_defender} damage to #{deffender.name}")
    end 
  end

  # checking if fighters can regenerate their hp at the end of turn
  def check_regeneration(fighter)
    fighter_regenaration_level=fighter.get_regeneration_level_if_has_one
    if fighter_regenaration_level!=0 && fighter.max_health>=(fighter.health+fighter_regenaration_level)
      fighter.health+=fighter_regenaration_level 
      @fight_results_arr.push(regenerated:"#{fighter.name} has regenerated his health by #{fighter_regenaration_level}")
    end
  end
  
  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all
    @able_to_fight_array=[]
    Statistic.order(created_at: :desc).pluck(:fighter_id).each do |fighter_id|
      if Fighter.find_by("id=#{fighter_id}").skills.count>2
        @able_to_fight_array.push(fighter_id)
      end
    end
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
    @fighter_data=FighterDatum.new(@statistic.fighter_id)
  end

  # GET /statistics/new
  def new
    @statistic = Statistic.new
  end

  # GET /statistics/1/edit
  def edit
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = Statistic.new(statistic_params)

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: 'Fighter was successfully created.' }
        format.json { render :show, status: :created, location: @statistic }
      else
        format.html { render :new }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics/1
  # PATCH/PUT /statistics/1.json
  def update
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to @statistic, notice: 'Fighter\'s data was successfully updated.' }
        format.json { render :show, status: :ok, location: @statistic }
      else
        format.html { render :edit }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic.destroy
    respond_to do |format|
      format.html { redirect_to statistics_url, notice: 'Fighter has been dismissed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = Statistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statistic_params
      params.require(:statistic).permit(:fighter_id, :win, :lost, :experience)
    end
end
