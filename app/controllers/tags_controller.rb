class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def show
    @tag = Tag.find_by_name(params[:id]) || Tag.find_by_id(params[:id])
  end

  def index
    @tags = Tag.all
  end
end
