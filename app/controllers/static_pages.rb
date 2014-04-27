class StaticPagesController < ApplicationController
  skip_before_filter :any_current_user
  layout 'theme/layouts/full-width'

  before_filter :top_level_pages
  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record

  def show
    @page = StaticPage.find_by_id(params[:id])
    add_breadcrumb(@page.parent.title, @page.parent.page_path) if @page.parent.present?
    add_breadcrumb(@page.title, @page.page_path)
  end

  def top_level_pages
    @pages = StaticPage.top_level
  end

end