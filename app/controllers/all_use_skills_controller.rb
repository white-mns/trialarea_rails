class AllUseSkillsController < ApplicationController
  include MyUtility
  before_action :set_all_use_skill, only: [:show, :edit, :update, :destroy]

  # GET /all_use_skills
  def index
    resultno_set
    placeholder_set
    param_set
    skill_data_set

    @count  = AllUseSkill.notnil().ransack(params[:q]).result.hit_count()
    @search = AllUseSkill.notnil().page(params[:page]).ransack(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @all_use_skills = @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "skill_concatenate", params_name: "skill_concatenate_form", type: "concat")

    toggle_params_to_variable(params, @form_params, params_name: "show_data")
  end

  # GET /all_use_skills/1
  #def show
  #end

  # GET /all_use_skills/new
  #def new
  #  @all_use_skill = AllUseSkill.new
  #end

  # GET /all_use_skills/1/edit
  #def edit
  #end

  # POST /all_use_skills
  #def create
  #  @all_use_skill = AllUseSkill.new(all_use_skill_params)

  #  if @all_use_skill.save
  #    redirect_to @all_use_skill, notice: "All use skill was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /all_use_skills/1
  #def update
  #  if @all_use_skill.update(all_use_skill_params)
  #    redirect_to @all_use_skill, notice: "All use skill was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /all_use_skills/1
  #def destroy
  #  @all_use_skill.destroy
  #  redirect_to all_use_skills_url, notice: "All use skill was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_use_skill
      @all_use_skill = AllUseSkill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def all_use_skill_params
      params.require(:all_use_skill).permit(:result_no, :round_no, :battle_no, :skill_concatenate)
    end
end
