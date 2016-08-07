module Api
  class CrawlersController < ApplicationController
    before_action :set_crawler, only: [:show, :edit, :update, :destroy]
    skip_before_filter :verify_authenticity_token
    # POST /crawl_data
    def crawl_data
      @crawler = Crawler.new(crawler_params)
      begin
        @crawler.crawl_data
        if @crawler.save
          render json: @crawler, status: :created, location: [:api, @crawler]
        else
          render json: @crawler.errors, status: :unprocessable_entity
        end
      rescue Exception => error
        render json: {error_message: "Can not Open File/URL"}, status: :not_found, location: [:api, @crawler]
      end
    end

    # GET /crawlers
    # GET /crawlers.json
    def index
      @crawlers = Crawler.all
      render json: @crawlers, status: 200
    end

    # GET /crawlers/1
    # GET /crawlers/1.json
    def show
    end

    # GET /crawlers/new
    def new
      @crawler = Crawler.new
    end

    # GET /crawlers/1/edit
    def edit
    end

    # POST /crawlers
    # POST /crawlers.json
    def create
      @crawler = Crawler.new(crawler_params)
      if @crawler.save
        render json: @crawler, status: 201, location: [:api, @crawler]
      else
        render json: @crawler.errors, status: 422
      end
      # respond_to do |format|
      #   if @crawler.save
      #     format.html { redirect_to @crawler, notice: 'Crawler was successfully created.' }
      #     format.json { render :show, status: :created, location: @crawler }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @crawler.errors, status: :unprocessable_entity }
      #   end
      # end
    end

    # PATCH/PUT /crawlers/1
    # PATCH/PUT /crawlers/1.json
    def update
      respond_to do |format|
        if @crawler.update(crawler_params)
          format.html { redirect_to @crawler, notice: 'Crawler was successfully updated.' }
          format.json { render :show, status: :ok, location: [:api, @crawler] }
        else
          format.html { render :edit }
          format.json { render json: @crawler.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /crawlers/1
    # DELETE /crawlers/1.json
    def destroy
      @crawler.destroy
      respond_to do |format|
        format.html { redirect_to crawlers_url, notice: 'Crawler was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawler
      @crawler = Crawler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawler_params
      params.require(:crawler).permit(:url, :h1_content, :h2_content, :h3_content, :link_content, :term)
    end
  end
end
