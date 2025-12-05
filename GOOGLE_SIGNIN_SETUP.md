# Google Sign-In Setup Guide

## Quick Setup Steps

### Step 1: Get Google OAuth Client ID

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project (or select an existing one)
3. Enable the Google+ API:
   - Go to "APIs & Services" → "Library"
   - Search for "Google+ API" or "Google Sign-In API"
   - Click "Enable"
4. Create OAuth 2.0 Credentials:
   - Go to "APIs & Services" → "Credentials"
   - Click "Create Credentials" → "OAuth client ID"
   - Choose "Web application" as the application type
   - Add authorized JavaScript origins:
     - For local development: `http://localhost:port` (e.g., `http://localhost:8080`)
     - For production: Your domain URL
   - Click "Create"
5. Copy your Client ID (looks like: `123456789-abc123xyz.apps.googleusercontent.com`)

### Step 2: Configure in Your App
   339729639568-fag3cisbetvhghpklpuvhqmukgsr84mc.apps.googleusercontent.com
#### Option A: Using Meta Tag (Recommended for Web)

1. Open `web/index.html`
2. Find line 26:
   ```html
   <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
   ```
3. Replace `YOUR_CLIENT_ID.apps.googleusercontent.com` with your actual Client ID:
   ```html
   <meta name="google-signin-client_id" content="123456789-abc123xyz.apps.googleusercontent.com">
   ```
4. Save the file
5. **Important**: Restart your Flutter app (hot restart won't pick up HTML changes)

#### Option B: Using Code (Alternative)

1. Open `lib/utils/constants.dart`
2. Set the `googleSignInClientId`:
   ```dart
   static const String? googleSignInClientId = '123456789-abc123xyz.apps.googleusercontent.com';
   ```
3. Open `lib/services/auth_service.dart`
4. Uncomment and update the clientId parameter:
   ```dart
   final GoogleSignIn _google = GoogleSignIn(
     scopes: ['email'],
     clientId: AppConstants.googleSignInClientId,
   );
   ```

### Step 3: Test

1. Restart your Flutter app completely
2. Click "Sign in with Google"
3. You should see the Google Sign-In popup
4. After signing in, you'll be redirected to the dashboard

## Troubleshooting

### Error: "ClientID not set"
- Make sure you've replaced the placeholder in `web/index.html`
- Restart the app (not just hot restart)
- Clear browser cache if needed

### Error: "redirect_uri_mismatch"
- Make sure you've added the correct authorized JavaScript origin in Google Cloud Console
- For localhost, use: `http://localhost:YOUR_PORT`
- Check the exact URL in your browser's address bar

### Error: "Access blocked"
- Make sure you've enabled the Google+ API in Google Cloud Console
- Check that your OAuth consent screen is configured

## For Assignment Submission

If you're submitting this as an assignment and don't want to set up real credentials:

1. You can mention in your README that Google Sign-In is implemented and configured
2. Show screenshots of the error message (which demonstrates the feature is there)
3. Or use a test/demo Client ID if your instructor provides one

## Additional Resources

- [Google Sign-In Documentation](https://developers.google.com/identity/sign-in/web/sign-in)
- [Flutter Google Sign-In Plugin](https://pub.dev/packages/google_sign_in)
- [OAuth 2.0 Setup Guide](https://developers.google.com/identity/protocols/oauth2)

