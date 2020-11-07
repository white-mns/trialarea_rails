class SkillConcatenatesController < ApplicationController
  include MyUtility
  before_action :set_skill_concatenate, only: [:show, :edit, :update, :destroy]

  # GET /skill_concatenates
  def index
    resultno_set
    placeholder_set
    param_set

    @count  = SkillConcatenate.distinct.notnil().includes(:pc_name).search(params[:q]).result.hit_count()
    @search = SkillConcatenate.distinct.notnil().includes(:pc_name).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @skill_concatenates = @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "skill_concatenate", params_name: "skill_concatenate_form", type: "concat")

    params_to_form(params, @form_params, column_name: "skill_skill_text", params_name: "text_form", type: "text")

    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_physics", query_name:"skill_skill_is_physics_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_fire",    query_name:"skill_skill_is_fire_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_aqua",    query_name:"skill_skill_is_aqua_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_wind",    query_name:"skill_skill_is_wind_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_quake",   query_name:"skill_skill_is_quake_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_light",   query_name:"skill_skill_is_light_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_dark",    query_name:"skill_skill_is_dark_eq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_poison",  query_name:"skill_skill_is_poison_eq", value: 1})

  end
  # GET /skill_concatenates/1
  #def show
  #end

  # GET /skill_concatenates/new
  #def new
  #  @skill_concatenate = SkillConcatenate.new
  #end

  # GET /skill_concatenates/1/edit
  #def edit
  #end

  # POST /skill_concatenates
  #def create
  #  @skill_concatenate = SkillConcatenate.new(skill_concatenate_params)

  #  if @skill_concatenate.save
  #    redirect_to @skill_concatenate, notice: "Skill concatenate was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /skill_concatenates/1
  #def update
  #  if @skill_concatenate.update(skill_concatenate_params)
  #    redirect_to @skill_concatenate, notice: "Skill concatenate was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /skill_concatenates/1
  #def destroy
  #  @skill_concatenate.destroy
  #  redirect_to skill_concatenates_url, notice: "Skill concatenate was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_concatenate
      @skill_concatenate = SkillConcatenate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_concatenate_params
      params.require(:skill_concatenate).permit(:result_no, :round_no, :link_no, :skill_concatenate)
    end
end
