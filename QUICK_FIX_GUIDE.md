# 🔧 Quick Fix: Google Sign-In Setup

## ⚡ Fastest Way (5 minutes)

### Step 1: Get Your Google Client ID (3 minutes)

1. **Open Google Cloud Console**
   - Go to: https://console.cloud.google.com/
   - Sign in with your Google account

2. **Create or Select a Project**
   - Click the project dropdown at the top
   - Click "New Project" (or select existing)
   - Name it: "Daily Health Tracker" (or any name)
   - Click "Create"

3. **Enable Google+ API**
   - In the left menu, go to "APIs & Services" → "Library"
   - Search for: `Google+ API` or `Google Sign-In API`
   - Click on it and click "Enable"

4. **Create OAuth Credentials**
   - Go to "APIs & Services" → "Credentials"
   - Click "+ CREATE CREDENTIALS" → "OAuth client ID"
   - If asked, configure OAuth consent screen:
     - User Type: External
     - App name: Daily Health Tracker
     - User support email: Your email
     - Developer contact: Your email
     - Click "Save and Continue" through the steps
   - Application type: **Web application**
   - Name: Daily Health Tracker Web
   - **Authorized JavaScript origins**: 
     - Click "+ ADD URI"
     - Add: `http://localhost:8080` (or your Flutter web port)
     - Add: `http://localhost:3000` (common alternative)
   - Click "CREATE"
   - **COPY YOUR CLIENT ID** (looks like: `123456789-abc.apps.googleusercontent.com`)

### Step 2: Add Client ID to Your App (1 minute)

1. **Open** `web/index.html` in your project
2. **Find line 35** (the meta tag with `google-signin-client_id`)
3. **Replace** `YOUR_CLIENT_ID.apps.googleusercontent.com` with your actual Client ID

**Before:**
```html
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
```

**After (example):**
```html
<meta name="google-signin-client_id" content="123456789-abc123xyz.apps.googleusercontent.com">
```

4. **Save the file**

### Step 3: Restart Your App (1 minute)

⚠️ **IMPORTANT**: You MUST do a **full restart**, not hot restart!

1. **Stop your Flutter app** completely
2. **Start it again** with: `flutter run -d chrome`
3. **Try signing in** - it should work now!

---

## 🎯 Visual Guide

### Where to Find Your Client ID:
```
Google Cloud Console
  └─ APIs & Services
      └─ Credentials
          └─ OAuth 2.0 Client IDs
              └─ [Your Client ID here]
```

### What Your Client ID Looks Like:
```
123456789-abcdefghijklmnopqrstuvwxyz.apps.googleusercontent.com
```

### Where to Put It:
```html
<!-- In web/index.html, line 35 -->
<meta name="google-signin-client_id" content="PASTE_YOUR_CLIENT_ID_HERE">
```

---

## ❌ Common Mistakes

1. **Using hot restart** - HTML changes need full restart
2. **Wrong port** - Make sure authorized origin matches your actual port
3. **Copying wrong ID** - Make sure it's the Web application Client ID
4. **Forgetting to enable API** - Google+ API must be enabled

---

## 🆘 Still Not Working?

### Check Your Port
1. Look at your browser URL when running Flutter web
2. It might be `http://localhost:8080` or `http://localhost:3000` or another port
3. Make sure that exact URL is in "Authorized JavaScript origins"

### Clear Browser Cache
- Press `Ctrl+Shift+Delete` (Windows) or `Cmd+Shift+Delete` (Mac)
- Clear cached images and files
- Restart browser

### Verify Your Setup
- ✅ Client ID copied correctly (no extra spaces)
- ✅ Meta tag is in `<head>` section
- ✅ App fully restarted (not hot restart)
- ✅ Google+ API is enabled
- ✅ Authorized origin matches your localhost URL

---

## 📝 For Assignment/Testing

If you're submitting this as an assignment and can't set up real credentials:

1. **Document the setup**: Mention in README that Google Sign-In is implemented
2. **Show the error**: The error message proves the feature exists
3. **Explain**: "Google Sign-In is fully implemented. To enable it, configure OAuth Client ID as per instructions in GOOGLE_SIGNIN_SETUP.md"

---

## ✅ Success Checklist

- [ ] Google Cloud project created
- [ ] Google+ API enabled
- [ ] OAuth Client ID created (Web application)
- [ ] Authorized JavaScript origin added (localhost:port)
- [ ] Client ID copied
- [ ] Client ID pasted in web/index.html
- [ ] File saved
- [ ] App fully restarted
- [ ] Sign-in button clicked
- [ ] Google popup appears! 🎉

