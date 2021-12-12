class UtilisateursController < ApplicationController
     before_action :verification, only: [:profil]
  def index
    @utilisateur = Utilisateur.new
  end

  def profil
    @utilisateur =Utilisateur.find(session[:id_session])
    @solde=@utilisateur.ttenter-@utilisateur.ttsortit
    @operations=Operation.all.where(utilisateur_id:session[:id_session] )
  end
 
  def inscription
    @utilisateur = Utilisateur.new
  end 


 def connection
       
      @utilisateur=Utilisateur.create(connect_params);
    
      unutilisateur = Utilisateur.find_by identifiant: @utilisateur.identifiant , motdepasse: @utilisateur.motdepasse
  
       
     if unutilisateur.blank?

       redirect_to utilisateurs_index_path, danger:"identifiant ou mot de passe incorrecte"
      
    else
      session[:id_session] = unutilisateur.id
      redirect_to  utilisateurs_profil_path
      
     end 
  end 

  def create
       user=Utilisateur.create(utilisateur_params)
       if user.save==true
         redirect_to utilisateurs_index_path, message:"Félicitation ! Vous pouvez vous connecter"
    else
         redirect_to utilisateurs_inscription_path, message:"Vous devez remplir tous les champs"
  end 
 end  


  def deconnexion
    session.destroy
    redirect_to utilisateurs_index_path, message:"Déconnexion éffectuée !"
  end

private

  def utilisateur_params
    params.require(:utilisateur).permit(:identifiant, :motdepasse, :nom)
  end


  def connect_params
    params.require(:utilisateur).permit(:identifiant, :motdepasse)
  end
 
  def verification
   if session[:id_session].blank?
     redirect_to utilisateurs_index_path, danger: "Acune session active. Veillez vous connetez" 
     end
 end


end
 