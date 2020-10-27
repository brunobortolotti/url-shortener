class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  # GET /urls
  def index
    @urls = Url.order(visit_count: :desc)

    render json: @urls
  end

  # GET /urls/1
  def show
    if @url.present?
      @url.increment_visits!
      redirect_to @url.source
    else
      render json: { error: 'URL not found' }, status: :not_found
    end
  end

  # POST /urls
  def create
    @url = Url.new({ source: url_params[:url] })

    if @url.save
      render json: { url: @url.key }, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by(key: params[:key])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.permit(:url)
    end
end
