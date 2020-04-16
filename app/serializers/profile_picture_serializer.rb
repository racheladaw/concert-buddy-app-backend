class ProfilePictureSerializer

  def initialize(profile_picture: nil, user:)
    @profile_picture = profile_picture
    @user = user
  end

  def serialize_new_profile_picture()
    serialized_new_profile_picture = serialize_profile_picture(@profile_picture, @user)
    serialized_new_profile_picture.to_json()
  end

  private

  def serialize_profile_picture(profile_picture, user)
    {
      profile_picture: {
        user_id: user.id,
        image_url: user.get_profile_picture_url(),
        created_at: profile_picture.created_at
      }
    }
  end

end
