class MatchingsController < ApplicationController
  include MyUtility
  before_action :set_matching, only: [:show, :edit, :update, :destroy]

  # GET /matchings
  def index
    resultno_set
    placeholder_set
    param_set

    @count  = Matching.notnil().includes(:left_pc_name, :right_pc_name).search(params[:q]).result.hit_count()
    @search = Matching.notnil().includes(:left_pc_name, :right_pc_name).page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @matchings = @search.result.per(50)
  end

  def param_set
    @form_params = {}

    params_clean(params)
    unless params["is_form"]
      params["result_no_form"] ||= sprintf("%d",@latest_result)
      params["round_no_form"] ||= sprintf("%d",@latest_round)
    end

    params_to_form(params, @form_params, column_name: "left_searchs_pc_name_name_or_right_searchs_pc_name_name",   params_name: "pc_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "left_searchs_pc_name_player_or_right_searchs_pc_name_player", params_name: "player_form",  type: "text")
    params_to_form(params, @form_params, column_name: "left_searchs_pc_name_player_id_or_right_searchs_pc_name_player_id", params_name: "player_id_form",  type: "number")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "round_no", params_name: "round_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "battle_no", params_name: "battle_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "left_link_no", params_name: "left_link_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "right_link_no", params_name: "right_link_no_form", type: "number")

    toggle_params_to_variable(params, @form_params, params_name: "show_data")
  end
  # GET /matchings/1
  #def show
  #end

  # GET /matchings/new
  #def new
  #  @matching = Matching.new
  #end

  # GET /matchings/1/edit
  #def edit
  #end

  # POST /matchings
  #def create
  #  @matching = Matching.new(matching_params)

  #  if @matching.save
  #    redirect_to @matching, notice: "Matching was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /matchings/1
  #def update
  #  if @matching.update(matching_params)
  #    redirect_to @matching, notice: "Matching was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /matchings/1
  #def destroy
  #  @matching.destroy
  #  redirect_to matchings_url, notice: "Matching was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matching
      @matching = Matching.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def matching_params
      params.require(:matching).permit(:result_no, :round_no, :battle_no, :left_link_no, :right_link_no)
    end
end
