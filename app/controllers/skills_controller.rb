class SkillsController < ApplicationController
  include MyUtility
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  def index
    resultno_set
    placeholder_set
    param_set

    if params["show_total"] == "1"
      @maxes  = Name.distinct.notnil().group(:result_no, :round_no).count();
    end
    @skill_data = Hash[*SkillList.pluck(:name, :text).flatten]
    @count  = Skill.distinct.notnil().includes(:pc_name).groups(params).search(params[:q]).result.hit_count()
    @search = Skill.distinct.notnil().includes(:pc_name).groups(params).aggregations(params).having_order(params).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty? && params["ex_sort"] != "on"
    @skills = @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "link_no", params_name: "link_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_id", params_name: "skill_id_form", type: "number")

    params_to_form(params, @form_params, column_name: "skill_name", params_name: "skill_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "skill_ap", params_name: "ap_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_text", params_name: "text_form", type: "text")

    checkbox_params_set_query_any(params, @form_params, query_name: "skill_skill_type_eq_any",
                             checkboxes: [{params_name: "type_skill", value: 0, first_checked: false},
                                          {params_name: "type_ability" , value: 1, first_checked: false},
                                          {params_name: "type_awake" , value: 2, first_checked: false}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_physics", query_name:"skill_is_physics_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_fire", query_name:"skill_is_fire_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_aqua", query_name:"skill_is_aqua_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_wind", query_name:"skill_is_wind_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_quake", query_name:"skill_is_quake_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_light", query_name:"skill_is_light_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_dark", query_name:"skill_is_dark_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_poison", query_name:"skill_is_poison_eq", value: 1})

    @form_params["ex_sort"] = params["ex_sort"]

    toggle_params_to_variable(params, @form_params, params_name: "show_skill_text")
    toggle_params_to_variable(params, @form_params, params_name: "show_total")
  end
  # GET /skills/1
  #def show
  #end

  # GET /skills/new
  #def new
  #  @skill = Skill.new
  #end

  # GET /skills/1/edit
  #def edit
  #end

  # POST /skills
  #def create
  #  @skill = Skill.new(skill_params)

  #  if @skill.save
  #    redirect_to @skill, notice: "Skill was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /skills/1
  #def update
  #  if @skill.update(skill_params)
  #    redirect_to @skill, notice: "Skill was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /skills/1
  #def destroy
  #  @skill.destroy
  #  redirect_to skills_url, notice: "Skill was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_params
      params.require(:skill).permit(:result_no, :round_no, :link_no, :skill_id)
    end
end
