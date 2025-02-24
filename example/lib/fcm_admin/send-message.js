var admin = require('firebase-admin');
// 1. Download a service account key (JSON file) from your Firebase console and add to the example/lib/fcm_admin directory
var serviceAccount = require('./service-acc.json');
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

// 2. Copy the token for your device that is printed in the console on app start (`flutter run`) for the FirebaseMessaging example
const token = 'YOUR_FCM_TOKEN';


// 3. From your terminal, root to example/lib/fcm_admin directory & run `npm install`.
// 4. Run `npm run send-message` in the example/scripts directory and your app will receive messages in any state; foreground, background, terminated.
// If you find your messages have stopped arriving, it is extremely likely they are being throttled by the platform. iOS in particular
// are aggressive with their throttling policy.
admin
    .messaging()
    .send(
        {
            token: token.trim(),
            data: {
                foo: 'bar',
            },
            notification: {
                title: 'TechMind A great title',
                body: 'TechMind A Great content',
            },
            android: {
                priority: 'high',
                notification: { tag: "Android4" }
            },
            apns: {
                payload: {
                    aps: {
                        contentAvailable: true,
                    },
                },
            },
        },
    )
    .then((res) => {
        if (res.failureCount) {
            console.log('Failed', res.results[0].error);
        } else {
            console.log('Success');
        }
    })
    .catch((err) => {
        console.log('Error:', err);
    });
