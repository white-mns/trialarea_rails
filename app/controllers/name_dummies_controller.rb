class NameDummiesController < ApplicationController
  include MyUtility
  before_action :set_name_dummy, only: [:show, :edit, :update, :destroy]

  # GET /name_dummies
  def index
    resultno_set
    placeholder_set
    param_set

    @count  = NameDummy.notnil().search(params[:q]).result.hit_count()
    @search = NameDummy.notnil().page(params[:page]).search(params[:q])
    @search.sorts = "id asc" if @search.sorts.empty?
    @name_dummies = @search.result.per(50)
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
    params_to_form(params, @form_params, column_name: "player_id", params_name: "player_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "link_no", params_name: "link_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "name", params_name: "name_form", type: "number")
    params_to_form(params, @form_params, column_name: "player", params_name: "player_form", type: "number")

    toggle_params_to_variable(params, @form_params, params_name: "show_data")
  end
  # GET /name_dummies/1
  #def show
  #end

  # GET /name_dummies/new
  #def new
  #  @name_dummy = NameDummy.new
  #end

  # GET /name_dummies/1/edit
  #def edit
  #end

  # POST /name_dummies
  #def create
  #  @name_dummy = NameDummy.new(name_dummy_params)

  #  if @name_dummy.save
  #    redirect_to @name_dummy, notice: "Name dummy was successfully created."
  #  else
  #    render action: "new"
  #  end
  #end

  # PATCH/PUT /name_dummies/1
  #def update
  #  if @name_dummy.update(name_dummy_params)
  #    redirect_to @name_dummy, notice: "Name dummy was successfully updated."
  #  else
  #    render action: "edit"
  #  end
  #end

  # DELETE /name_dummies/1
  #def destroy
  #  @name_dummy.destroy
  #  redirect_to name_dummies_url, notice: "Name dummy was successfully destroyed."
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name_dummy
      @name_dummy = NameDummy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def name_dummy_params
      params.require(:name_dummy).permit(:result_no, :round_no, :player_id, :link_no, :name, :player)
    end
end
