class EnsemblesController < ApplicationController

  # GET: /ensembles
  get "/ensembles" do
    erb :"/ensembles/index.html"
  end

  # GET: /ensembles/new
  get "/ensembles/new" do
    erb :"/ensembles/new.html"
  end

  # POST: /ensembles
  post "/ensembles" do
    redirect "/ensembles"
  end

  # GET: /ensembles/5
  get "/ensembles/:id" do
    erb :"/ensembles/show.html"
  end

  # GET: /ensembles/5/edit
  get "/ensembles/:id/edit" do
    erb :"/ensembles/edit.html"
  end

  # PATCH: /ensembles/5
  patch "/ensembles/:id" do
    redirect "/ensembles/:id"
  end

  # DELETE: /ensembles/5/delete
  delete "/ensembles/:id/delete" do
    redirect "/ensembles"
  end
end
