require "test_helper"

class SystemDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = FactoryBot.create(:user)
    login_as(user: user)
  end

  test "GET #index returns a hash containing all Systems' data" do
    FactoryBot.create(:system, :sol)
    FactoryBot.create(:system, :proxima_centauri)

    get(system_data_path, params: { format: :json })
    assert_response(:ok)

    expected_payload = {
      name: ["Sol", "Proxima Centauri"],
      x: [5.0e-06, -0.472264],
      y: [0.0, -0.361451],
      z: [0.0, -1.151219],
      absolute_magnitude: [4.85, 15.447]
    }

    assert_equal(
      expected_payload.with_indifferent_access,
      JSON.parse(body).with_indifferent_access
    )
  end
end
