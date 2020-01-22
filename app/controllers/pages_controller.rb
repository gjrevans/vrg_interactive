class PagesController < ApplicationController

  def index
    @our_work = JSON.parse(File.read('public/json/our_work.json'))
    @clients = JSON.parse(File.read('public/json/clients.json'))
    flash[:error] = "What the fuck"
  end
end
