class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  # GET /urls/1
  def show
    if @url.present?
      redirect_to @url.source
    else
      render json: { error: 'URL not found' }, status: :not_found
    end
  end

  # POST /urls
  def create
    @url = Url.new({ source: url_params[:url] })

    if @url.save
      render json: @url, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
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
