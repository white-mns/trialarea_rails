class SkillListsController < ApplicationController
  include MyUtility
  before_action :set_skill_list, only: [:show, :edit, :update, :destroy]

  # GET /skill_lists
  def index
    resultno_set
    placeholder_set
    param_set

    @skill_data = Hash[*SkillList.pluck(:name, :text).flatten]
    @count  = SkillList.ransack(params[:q]).result.hit_count()
    @search = SkillList.page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @skill_lists = @search.result.per(50)
  end

  def param_set
    @form_params = {}

    params_clean(params)
    unless params["is_form"]
      params["result_no_form"] ||= sprintf("%d",@latest_result)
      params["round_no_form"] ||= sprintf("%d",@latest_round)
    end

    params_to_form(params, @form_params, column_name: "skill_id", params_name: "skill_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "name", params_name: "name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "skill_type", params_name: "skill_type_form", type: "number")
    params_to_form(params, @form_params, column_name: "ap", params_name: "ap_form", type: "number")
    params_to_form(params, @form_params, column_name: "priority", params_name: "priority_form", type: "number")
    params_to_form(params, @form_params, column_name: "text", params_name: "text_form", type: "text")
    params_to_form(params, @form_params, column_name: "is_physics", params_name: "is_physics_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_fire", params_name: "is_fire_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_aqua", params_name: "is_aqua_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_wind", params_name: "is_wind_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_quake", params_name: "is_quake_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_light", params_name: "is_light_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_dark", params_name: "is_dark_form", type: "number")
    params_to_form(params, @form_params, column_name: "is_poison", params_name: "is_poison_form", type: "number")

    checkbox_params_set_query_any(params, @form_params, query_name: "skill_type_eq_any",
                             checkboxes: [{params_name: "type_skill", value: 0, first_checked: false},
                                          {params_name: "type_ability" , value: 1, first_checked: false},
                                          {params_name: "type_awake" , value: 2, first_checked: false}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_physics", query_name:"is_physics_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_fire", query_name:"is_fire_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_aqua", query_name:"is_aqua_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_wind", query_name:"is_wind_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_quake", query_name:"is_quake_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_light", query_name:"is_light_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_dark", query_name:"is_dark_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_poison", query_name:"is_poison_eq", value: 1})

    toggle_params_to_variable(params, @form_params, params_name: "show_data")
  end
  # GET /skill_lists/1
  #def show
  #end

  # GET /skill_lists/new
  #def new
  #  @skill_list = SkillList.new
  #end

  # GET /skill_lists/1/edit
  #def edit
  #end

  # POST /skill_lists
  #def create
  #  @skill_list = SkillList.new(skill_list_params)

  #  if @skill_list.save
  #    redirect_to @skill_list, notice: "Skill list was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /skill_lists/1
  #def update
  #  if @skill_list.update(skill_list_params)
  #    redirect_to @skill_list, notice: "Skill list was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /skill_lists/1
  #def destroy
  #  @skill_list.destroy
  #  redirect_to skill_lists_url, notice: "Skill list was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_list
      @skill_list = SkillList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_list_params
      params.require(:skill_list).permit(:skill_id, :name, :result_no, :skill_type, :ap, :text, :is_physics, :is_fire, :is_aqua, :is_wind, :is_quake, :is_light, :is_dark, :is_poison)
    end
end
