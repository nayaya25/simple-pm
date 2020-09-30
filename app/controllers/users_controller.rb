class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this
    before_action 
    # GET /users
    # GET /users.json
    def index
        @user = User.find(current_user.id)
        if @user && @user.is_admin
            @users = User.all
        else
            flash[:notice] =  "Unauthorized"
            redirect_to '/'
        end
     
    end
  
    # # GET /users/1
    # # GET /users/1.json
    def show
        @user = User.new
    end
  
    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
    end
  
    # # PATCH/PUT /users/1
    # # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
        @user = User.new(params[user_params])
        if @user.save
          redirect_to @user, :flash => { :success => 'User was successfully created.' }
        else
          render :action => 'new'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
      end
  
  end