Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '187675932581-ihe3j2ps1o5t7h37vmg5fjbg46a84vqs.apps.googleusercontent.com', '-VHIqAxZwvnN6hdwc3X52Two', {
    name: 'google',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    approval_prompt: '',
    skip_jwt: true
  }
end
