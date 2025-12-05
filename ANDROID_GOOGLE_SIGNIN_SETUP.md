# 🔧 Android Google Sign-In Setup (Fix Error Code 10)

## The Problem
Error: `PlatformException(sign_in_failed, com.google.android.gms.common.api.ApiException: 10:)`

This means your **SHA-1 fingerprint** is not configured in Google Cloud Console.

## ✅ Solution (Step-by-Step)

### Step 1: Get Your SHA-1 Fingerprint

#### Option A: Using Gradle (Easiest)

1. Open terminal in your project root
2. Run this command:

**For Windows:**
```bash
cd android
gradlew signingReport
```

**For Mac/Linux:**
```bash
cd android
./gradlew signingReport
```

3. Look for the output that shows:
   ```
   Variant: debug
   Config: debug
   Store: C:\Users\...\.android\debug.keystore
   Alias: AndroidDebugKey
   SHA1: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX
   ```

4. **Copy the SHA1 value** (the long string of letters and numbers separated by colons)

#### Option B: Using Keytool (Alternative)

**For Windows:**
```bash
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```

**For Mac/Linux:**
```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Look for `SHA1:` in the output and copy it.

### Step 2: Create Android OAuth Client ID

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project (or create one)
3. Go to **"APIs & Services" → "Credentials"**
4. Click **"+ CREATE CREDENTIALS" → "OAuth client ID"**
5. If you haven't configured OAuth consent screen:
   - Click "Configure Consent Screen"
   - User Type: **External**
   - App name: Daily Health Tracker
   - User support email: Your email
   - Developer contact: Your email
   - Click "Save and Continue" through all steps
6. Back to creating OAuth client ID:
   - Application type: **Android**
   - Name: Daily Health Tracker Android
   - **Package name**: `com.example.daily_health_tracker` (from your `build.gradle.kts`)
   - **SHA-1 certificate fingerprint**: Paste the SHA-1 you copied in Step 1
   - Click **"CREATE"**
7. **Copy the Client ID** (you'll need it if you want to use it in code)

### Step 3: Verify Your Package Name

Make sure your package name matches:

1. Open `android/app/build.gradle.kts`
2. Check line 25: `applicationId = "com.example.daily_health_tracker"`
3. This must **exactly match** the package name you entered in Google Cloud Console

### Step 4: Test

1. **Stop your app completely**
2. **Rebuild and run:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```
3. Try signing in - it should work now!

---

## 🔍 Troubleshooting

### Still Getting Error Code 10?

1. **Double-check SHA-1:**
   - Make sure you copied the SHA-1 from the **debug** variant
   - It should be 20 pairs of hex digits separated by colons
   - Example: `A1:B2:C3:D4:E5:F6:...`

2. **Verify Package Name:**
   - Check `android/app/build.gradle.kts` line 25
   - Must match exactly (case-sensitive) in Google Cloud Console

3. **Wait a Few Minutes:**
   - Google Cloud Console changes can take 5-10 minutes to propagate
   - Try again after waiting

4. **Check OAuth Consent Screen:**
   - Make sure it's configured and published (or in testing mode with your email added)

5. **Multiple SHA-1 Fingerprints:**
   - If you have multiple debug keystores, make sure you're using the right one
   - You can add multiple SHA-1 fingerprints to the same OAuth client ID

### For Release Builds

When building for release, you'll need to:

1. Get the SHA-1 from your **release keystore**:
   ```bash
   keytool -list -v -keystore your-release-key.jks -alias your-key-alias
   ```

2. Add that SHA-1 to the same Android OAuth client ID in Google Cloud Console
3. Or create a separate OAuth client ID for release builds

---

## 📝 Quick Checklist

- [ ] Got SHA-1 fingerprint from debug keystore
- [ ] Created Android OAuth client ID in Google Cloud Console
- [ ] Added SHA-1 to the OAuth client ID
- [ ] Package name matches exactly: `com.example.daily_health_tracker`
- [ ] OAuth consent screen configured
- [ ] Waited 5-10 minutes for changes to propagate
- [ ] Rebuilt app (`flutter clean` then `flutter run`)
- [ ] Tested sign-in

---

## 🎯 Alternative: Use Web Client ID (Simpler for Testing)

If you just want to test quickly, you can use the Web Client ID:

1. Create a **Web application** OAuth client ID (as you did for web)
2. In `lib/services/auth_service.dart`, uncomment and set the clientId:
   ```dart
   import '../utils/constants.dart';
   
   GoogleSignIn? get _googleSignIn {
     // ...
     _google ??= GoogleSignIn(
       scopes: ['email'],
       clientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com', // Use web client ID
     );
   }
   ```

However, **the proper way** is to use Android OAuth client ID with SHA-1 fingerprint.

---

## ✅ Success!

Once configured correctly, Google Sign-In on Android should work without errors!

