class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    if params[:owner_name] == ""
      owner_object = Owner.find_by(id: params[:owner][:id])
    else
      owner_object = Owner.create(name: params[:owner_name])
    end
    @pet = Pet.create(name: params[:pet_name], owner: owner_object)

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
