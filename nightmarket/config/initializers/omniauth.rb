Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "933072630394-65fdeqd6vvgehrr197ajgi510cvch22i.apps.googleusercontent.com", "hxbH5C-ar5CWimBVgZCXYZiq", {
  	hd: "%w(stanford.edu alumni.stanford.edu)"
  }
end