class UrlsController < ApplicationController

    def new
        @url = Url.new
    end

    def create
        @url = Url.new(url_params)
        if @url.save
           render :show
        else
            render :new
        end
    end

    def show
        @url = Url.find(params[:id])
    end

    def redirect
        @url = Url.find_by(short_url: params[:short_url])
        if @url
            @url.increment!(:click_count)
            redirect_to @url.original_url
        else
            render plain: "URL not found", status: :not_found
        end
    end

    private

    def url_params
        params.require(:url).permit(:original_url)
    end
end
