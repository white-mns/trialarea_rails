class CharaUseSkillsController < ApplicationController
  include MyUtility
  before_action :set_chara_use_skill, only: [:show, :edit, :update, :destroy]

  # GET /chara_use_skills
  def index
    resultno_set
    placeholder_set
    param_set

    @count  = CharaUseSkill.notnil().includes(:pc_name, :seclusion_skill).search(params[:q]).result.hit_count()
    @search = CharaUseSkill.notnil().includes(:pc_name, :seclusion_skill).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @chara_use_skills = @search.result.per(50)
  end

  def param_set
    @form_params = {}

    params_clean(params)
    unless params["is_form"]
      params["result_no_form"] ||= sprintf("%d",@latest_result)
      params["round_no_form"] ||= sprintf("%d",@latest_round)
    end

    params_to_form(params, @form_params, column_name: "pc_name_name",   params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "pc_name_player", params_name: "player_form",  type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "round_no", params_name: "round_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "battle_no", params_name: "battle_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "link_no", params_name: "link_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_concatenate", params_name: "skill_concatenate_form", type: "concat")
    params_to_form(params, @form_params, column_name: "seclusion_skill_name",  params_name: "seclusion_skill_form", type: "text")

    toggle_params_to_variable(params, @form_params, params_name: "show_data")
  end
  # GET /chara_use_skills/1
  #def show
  #end

  # GET /chara_use_skills/new
  #def new
  #  @chara_use_skill = CharaUseSkill.new
  #end

  # GET /chara_use_skills/1/edit
  #def edit
  #end

  # POST /chara_use_skills
  #def create
  #  @chara_use_skill = CharaUseSkill.new(chara_use_skill_params)

  #  if @chara_use_skill.save
  #    redirect_to @chara_use_skill, notice: "Chara use skill was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /chara_use_skills/1
  #def update
  #  if @chara_use_skill.update(chara_use_skill_params)
  #    redirect_to @chara_use_skill, notice: "Chara use skill was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /chara_use_skills/1
  #def destroy
  #  @chara_use_skill.destroy
  #  redirect_to chara_use_skills_url, notice: "Chara use skill was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chara_use_skill
      @chara_use_skill = CharaUseSkill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chara_use_skill_params
      params.require(:chara_use_skill).permit(:result_no, :round_no, :battle_no, :link_no, :skill_concatenate)
    end
end
