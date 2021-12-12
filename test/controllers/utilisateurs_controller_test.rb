require "test_helper"

class UtilisateursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get utilisateurs_index_url
    assert_response :success
  end

  test "should get profil" do
    get utilisateurs_profil_url
    assert_response :success
  end

  test "should get ajouter" do
    get utilisateurs_ajouter_url
    assert_response :success
  end

  test "should get modifier" do
    get utilisateurs_modifier_url
    assert_response :success
  end

  test "should get listecomplet" do
    get utilisateurs_listecomplet_url
    assert_response :success
  end

  test "should get list" do
    get utilisateurs_list_url
    assert_response :success
  end

  test "should get supprimer" do
    get utilisateurs_supprimer_url
    assert_response :success
  end

  test "should get deconnexion" do
    get utilisateurs_deconnexion_url
    assert_response :success
  end
end
