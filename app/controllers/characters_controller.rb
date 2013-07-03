class CharactersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @characters = current_user.characters

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [current_user, @characters] }
    end
  end

  def show
    @character = current_user.characters.find_by_permalink(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [current_user, @character] }
    end
  end

  def new
    @character = current_user.characters.build(:user_id => current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: [current_user, @character] }
    end
  end

  def edit
    @character = current_user.characters.find_by_permalink(params[:id])
  end

  def create
    @character = current_user.characters.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to [current_user, @character], notice: 'Character was successfully created.' }
        format.json { render json: [current_user, @character], status: :created, location: [current_user, @character] }
      else
        format.html { render action: "new" }
        format.json { render json: [current_user, @character.errors], status: :unprocessable_entity }
      end
    end
  end

  def update
    @character = current_user.characters.find_by_permalink(params[:id])

    respond_to do |format|
      if @character.update_attributes(character_params)
        format.html { redirect_to [current_user, @character], notice: 'Character was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: [current_user, @character.errors], status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character = current_user.characters.find_by_id(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to users_characters_url }
      format.json { head :ok }
    end
  end

  private
  
  def character_params
    params.require(:character).permit!
  end
end

